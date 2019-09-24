<?php

namespace App\Modules\Conta\Service;

use App\Core\Service\AbstractService;
use App\Modules\Conselho\Model\Conselho as ConselhoModel;
use App\Modules\Conta\Mail\Usuario\CadastroComSucesso;
use App\Modules\Conta\Model\Perfil as PerfilModel;
use App\Modules\Conta\Model\Usuario as UsuarioModel;
use App\Modules\Core\Exceptions\EParametrosInvalidos;
use App\Modules\Eleitor\Model\Eleitor as EleitorModel;
use App\Modules\Organizacao\Model\Organizacao as OrganizacaoModel;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;


class Usuario extends AbstractService
{
    public function __construct(UsuarioModel $model)
    {
        parent::__construct($model);
    }

    public function gerarPrimeiroAcesso(Request $request)
    {
        try {
            DB::beginTransaction();

            switch ($request->tp_inscricao) {
                case 'eleitor':
                    $eleitorModel = app()->makeWith(EleitorModel::class);
                    $model = $eleitorModel->where('nu_cpf', $request->nu_cpf)->firstOrFail();
                    if(!empty($model->co_usuario)) {
                        throw new EParametrosInvalidos('O CPF não está inscrito como eleitor.');
                    }
                    $dadosUsuario = $model->toArray();
                    $dadosUsuario['co_perfil'] = PerfilModel::CODIGO_ELEITOR;
                    break;
                case 'conselho':
                    $conselhoModel = app()->makeWith(ConselhoModel::class);
                    $model = $conselhoModel->where('nu_cnpj', $request->nu_cnpj)->firstOrFail();
                    if(!empty($model->co_usuario)) {
                        throw new EParametrosInvalidos('O CNPJ não está inscrito no Vota Cultura.');
                    }
                    $representante = $model->representante;
                    $dadosUsuario = $representante->toArray();

                    if($dadosUsuario['nu_cpf'] !== $request->nu_cpf) {
                        throw new EParametrosInvalidos(
                            'O CPF informado não corresponde ao CPF do representante.'
                        );
                    }

                    $dadosUsuario['co_perfil'] = PerfilModel::CODIGO_CONSELHO;
                    break;
                case 'organizacao':
                    $organizacaoModel = app()->makeWith(OrganizacaoModel::class, $request->post());
                    $model = $organizacaoModel->where('nu_cnpj', $request->nu_cnpj)->firstOrFail();
                    if(!empty($model->co_usuario)) {
                        throw new EParametrosInvalidos('O CNPJ não está inscrito no Vota Cultura.');
                    }
                    $representante = $model->representante;
                    $dadosUsuario = $representante->toArray();

                    if($dadosUsuario['nu_cpf'] !== $request->nu_cpf) {
                        throw new EParametrosInvalidos(
                            'O CPF informado não corresponde ao CPF do representante.'
                        );
                    }

                    $dadosUsuario['co_perfil'] = PerfilModel::CODIGO_ORGANIZACAO;
                    break;
                default:
                    throw new EParametrosInvalidos("Tipo de inscrição desconhecido.");
                    break;
            }

            $usuarioModel = $this->cadastrar(collect($dadosUsuario));
            $model->co_usuario = $usuarioModel->co_usuario;
            $model->save();

            DB::commit();
            return $usuarioModel;
        } catch (EParametrosInvalidos $exception) {
            DB::rollBack();
            throw $exception;
        }
    }

    public function ativarUsuarioPorCodigoAtivacao($codigo_ativacao)
    {
        try {

            $usuario = $this->getModel()->where([
                'ds_codigo_ativacao' => $codigo_ativacao,
                'st_ativo' => false
            ])->first();
            if (!$usuario) {
                throw new EParametrosInvalidos('Usuario não encontrado', 422);
            }

            DB::beginTransaction();
            $usuario->st_ativo = true;
            $usuario->ds_codigo_ativacao = null;
            $usuario->save();
            DB::commit();

            return $usuario;

        } catch (EParametrosInvalidos $exception) {
            DB::rollBack();
            throw $exception;
        }

    }

    public function cadastrar(Collection $dados): ?Model
    {
        try {
            $usuario = $this->getModel()->where(
                $dados->only(['nu_cpf'])->toArray()
            )->first();

            if ($usuario) {
                throw new EParametrosInvalidos(
                    'Usuario já cadastrado.',
                    Response::HTTP_NOT_ACCEPTABLE
                );
            }

            $dados['ds_senha'] = substr(sha1(time()), 0, 8);
            DB::beginTransaction();
            $usuario = $this->getModel();
            unset($dados['dh_cadastro']);
            $usuario->fill($dados->toArray());
            $usuario->gerarCodigoAtivacao();
            $horarioAtual = Carbon::now();
            if(!empty($dados['perfil'])) {
                $usuario->co_perfil = $dados['perfil']['co_perfil'];
            }
            $usuario->dh_cadastro = $horarioAtual->toDateTimeString();
            $usuario->dh_ultima_atualizacao = $horarioAtual->toDateTimeString();
            $usuario->st_ativo = false;
            $usuario->setSenha($dados['ds_senha']);
            $usuario->save();

            $usuario->ds_senha = $dados['ds_senha'];

            Mail::to($usuario->ds_email)->send(
                app()->make(CadastroComSucesso::class, $usuario->toArray())
            );
            DB::commit();
            return $usuario;
        } catch (EParametrosInvalidos $queryException) {
            DB::rollBack();
            throw $queryException;
        }
    }

    public function alterarSenha(Request $request, int $co_usuario)
    {
        try {
            DB::beginTransaction();
            $dados = $request->all();
            if (!$dados || !isset($dados['ds_senha_atual'])) {
                throw new EParametrosInvalidos(
                    'Senha não informada.',
                    Response::HTTP_NOT_ACCEPTABLE
                );
            }
            $usuario = $this->getModel()->find($co_usuario);

            if (!$usuario || !$usuario->senhaValida($dados['ds_senha_atual']) ) {
                throw new EParametrosInvalidos(
                    'Dados inválidos.',
                    Response::HTTP_NOT_ACCEPTABLE
                );
            }

            if($usuario->senhaValida($dados['ds_senha'])) {
                throw new EParametrosInvalidos(
                    'A nova senha é igual a atual.',
                    Response::HTTP_NOT_ACCEPTABLE
                );
            }

            $usuario->setSenha($dados['ds_senha']);
            $usuario->save();
            DB::commit();
        } catch (EParametrosInvalidos $exception) {
            DB::rollBack();
            throw $exception;
        }
    }

    public function obterTodosComPerfis()
    {
        return $this
            ->getModel()
            ->get();
    }

    public function atualizar(Request $request, int $identificador) : ?Model
    {
        $dados = collect(
            $request->only([
                'co_usuario',
                'perfil',
                'st_ativo',
                'ds_email'
        ]));

        try {
            $usuario = $this->getModel()->where(
                $dados->only([
                    'co_usuario'
                ])->toArray()
            )->first();



            if (empty($usuario)) {
                throw new EParametrosInvalidos(
                    'Usuario não encontrado.',
                    Response::HTTP_NOT_ACCEPTABLE
                );
            }

            $usuarioMesmoEmail = $this->getModel()
                ->where(
                    $dados->only([
                        'ds_email',
                    ])->toArray())
                ->where(
                    'co_usuario',
                    '!=',
                    $dados->only(['co_usuario']))
                ->first();

            if ($usuarioMesmoEmail) {
                throw new EParametrosInvalidos(
                 'E-mail já cadastrado.',
                 Response::HTTP_NOT_ACCEPTABLE
                );
            }
            DB::beginTransaction();
            $usuario->fill($dados->toArray());
            $horarioAtual = Carbon::now();
            if(!empty($dados['perfil'])) {
                $usuario->co_perfil = $dados['perfil']['co_perfil'];
            }
            $usuario->dh_ultima_atualizacao = $horarioAtual->toDateTimeString();
            $usuario->save();


            DB::commit();
            return $usuario;
        } catch (EParametrosInvalidos $queryException) {
            DB::rollBack();
            throw $queryException;
        }


        try {
            $modelPesquisada = $this->getModel()->find($identificador);
            if (!$modelPesquisada) {
                throw new \HttpException(
                    'Dados não encontrados.',
                    Response::HTTP_NOT_ACCEPTABLE
                );
            }
            DB::beginTransaction();
            $modelPesquisada->fill($request->all());
            $modelPesquisada->save();
            DB::commit();
            return $modelPesquisada->toArray();
        } catch (\HttpException $queryException) {
            DB::rollBack();
            throw $queryException;
        }
    }

}
