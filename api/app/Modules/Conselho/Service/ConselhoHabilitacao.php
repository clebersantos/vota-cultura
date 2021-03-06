<?php

namespace App\Modules\Conselho\Service;

use App\Core\Service\AbstractService;
use App\Modules\Conselho\Model\ConselhoHabilitacao as ConselhoHabilitacaoModel;
use App\Modules\Core\Exceptions\EParametrosInvalidos;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Response;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ConselhoHabilitacao extends AbstractService
{
    public function __construct(ConselhoHabilitacaoModel $model)
    {
        parent::__construct($model);
    }

    public function cadastrar(Collection $dados): ?Model
    {
        try {
            DB::beginTransaction();
            $carbon = Carbon::now();
            $dadosInclusao = $dados->only(
                [
                    'co_conselho',
                    'st_avaliacao',
                    'ds_parecer',
                ]
            )->toArray();
            $dadosInclusao['dh_avaliacao'] = $carbon->toDateTimeString();

            $conselhoHabilitacao = $this->getModel()
                ->where($dadosInclusao)
                ->first();

            if ($conselhoHabilitacao) {
                throw new EParametrosInvalidos(
                    'Avaliação já realizada.',
                    Response::HTTP_NOT_ACCEPTABLE
                );
            }

            $novoConselhoHabilitacao = parent::cadastrar($dados);
            $arquivosHabilitacacao = [];
            if (!empty($dados['arquivosAvaliacao'])) {
                $dadosUsuarioLogado = Auth::user()->dadosUsuarioAutenticado();
                $indice = 0;
                foreach (array_values($dados['arquivosAvaliacao']) as $arquivoAvaliacao) {
                    $colecao = collect($arquivoAvaliacao);
                    $colecao['co_conselho_habilitacao'] = $novoConselhoHabilitacao->co_conselho_habilitacao;
                    $colecao['co_usuario_avaliador'] = $dadosUsuarioLogado['co_usuario'];
                    $colecao['dh_avaliacao'] = $carbon->toDateTimeString();
                    $arquivosHabilitacacao[$indice] = $colecao->only(
                        [
                            'co_representante_arquivo',
                            'st_em_conformidade',
                            'ds_observacao',
                            'co_usuario_avaliador',
                            'dh_avaliacao',
                            'co_conselho_habilitacao',
                        ]
                    )->toArray();
                    $indice++;
                }

                $novoConselhoHabilitacao->representanteArquivoAvaliacao()->insert($arquivosHabilitacacao);
            }

            DB::commit();
            return $novoConselhoHabilitacao;
        } catch (EParametrosInvalidos $queryException) {
            DB::rollBack();
            throw $queryException;
        }
    }
}
