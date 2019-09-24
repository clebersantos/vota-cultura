<?php

namespace App\Modules\Conta\Http\Controllers;

use App\Modules\Conta\Service\RecuperacaoSenha as RecuperacaoSenhaService;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;


class RecuperacaoSenhaController extends Controller
{

    private $recuperacaoSenhaService;

    public function __construct(RecuperacaoSenhaService $recuperacaoSenhaService)
    {
        $this->recuperacaoSenhaService = $recuperacaoSenhaService;

    }

    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        return $this->sendResponse($this->recuperacaoSenhaService->recuperarSenha(collect($request->all())),
            "Operação realizada com sucesso",
            Response::HTTP_CREATED
        );
    }


    public function update(Request $request, $ds_codigo_ativacao): \Illuminate\Http\JsonResponse
    {
        return $this->sendResponse(
            $this->recuperacaoSenhaService->alterarSenha($ds_codigo_ativacao, $request->only(['ds_senha'])),
            "Operação realizada com sucesso",
            Response::HTTP_OK
        );
    }
}
