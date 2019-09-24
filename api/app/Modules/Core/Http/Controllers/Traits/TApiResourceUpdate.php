<?php

namespace App\Modules\Core\Http\Controllers\Traits;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

trait TApiResourceUpdate
{
    public function update(Request $request, $identificador)
    {
        return $this->sendResponse(
            $this->service->atualizar($request, $identificador),
            "Operação realizada com sucesso",
            Response::HTTP_OK
        );
    }
}
