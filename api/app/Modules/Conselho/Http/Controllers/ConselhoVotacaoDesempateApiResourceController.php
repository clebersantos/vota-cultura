<?php

namespace App\Modules\Conselho\Http\Controllers;

use App\Modules\Conselho\Service\ConselhoVotacaoDesempate;
use App\Modules\Core\Exceptions\EMetodoIndisponivel;
use App\Modules\Core\Http\Controllers\AApiResourceController;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ConselhoVotacaoDesempateApiResourceController extends AApiResourceController
{
    public function __construct(ConselhoVotacaoDesempate $service)
    {
        $this->middleware('auth:api')->except(['index', 'listaFinal']);
        return parent::__construct($service);
    }

    public function index(): JsonResponse
    {
        return $this->sendResponse(
            $this->service->obterTodos(),
            "Operação realizada com sucesso",
            Response::HTTP_OK
        );
    }

    public function show(): JsonResponse
    {
        throw new EMetodoIndisponivel("Método indisponível.");
    }

    public function store(Request $request): JsonResponse
    {
        return $this->sendResponse(
            $this->service->publicarResultadoDaVotacao(collect($request->all())),
            "Operação realizada com sucesso",
            Response::HTTP_CREATED
        );
    }

    public function update(): \Illuminate\Http\JsonResponse
    {
        throw new EMetodoIndisponivel("Método indisponível.");
    }

    public function listaFinal (): \Illuminate\Http\JsonResponse
    {
        return $this->sendResponse(
            $this->service->obterListaFinal(),
            "Operação realizada com sucesso",
            Response::HTTP_OK
        );
    }

}
