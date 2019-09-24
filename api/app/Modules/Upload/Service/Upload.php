<?php

namespace App\Modules\Upload\Service;

use App\Core\Service\AbstractService;
use App\Modules\Upload\Model\Arquivo as ArquivoModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class Upload extends AbstractService
{
    public function __construct(ArquivoModel $model)
    {
        parent::__construct($model);
    }

    public function uploadArquivoCodificadoBase64($stringCodificada, $diretorioArmazenamento = '')
    {
        try {
            DB::beginTransaction();
            $arquivoDecodificado = base64_decode($stringCodificada);
            $model = $this->getModel();
            $nomeArquivo = uniqid() . '.' . $model->no_extensao;
            $localizacaoArquivo = "{$diretorioArmazenamento}/{$nomeArquivo}";
            Storage::put($localizacaoArquivo, $arquivoDecodificado);
            $model->ds_localizacao = $localizacaoArquivo;
            $model->save();
            DB::commit();
            return $model;
        } catch (\Exception $exception) {
            DB::rollBack();
            throw $exception;
        }
    }

    public function uploadArquivoCodificado(\Illuminate\Http\UploadedFile $binario, $diretorioArmazenamento = '')
    {
        try {
            DB::beginTransaction();
            $model = $this->getModel();
            $nomeArquivo = uniqid() . '.' . $model->no_extensao;
            $localizacaoArquivo = "{$diretorioArmazenamento}";
            Storage::putFileAs($localizacaoArquivo, $binario, $nomeArquivo);
            $model->ds_localizacao = "{$localizacaoArquivo}/{$nomeArquivo}";
            $model->save();
            DB::commit();
            return $model;
        } catch (\Exception $exception) {
            DB::rollBack();
            throw $exception;
        }
    }
}
