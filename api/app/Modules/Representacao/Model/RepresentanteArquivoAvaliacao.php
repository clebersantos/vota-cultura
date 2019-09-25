<?php

namespace App\Modules\Representacao\Model;

use App\Modules\Conselho\Model\Conselho;
use App\Modules\Conselho\Model\ConselhoHabilitacao;
use App\Modules\Core\Helper\Telefone as TelefoneHelper;
use App\Modules\Organizacao\Model\Organizacao;
use App\Modules\Upload\Model\Arquivo;
use Illuminate\Database\Eloquent\Model;


class RepresentanteArquivoAvaliacao extends Model
{
    protected $table = 'tb_representante_arquivo_avaliacao';
    protected $primaryKey = 'co_representante_arquivo_avaliacao';
    protected $dateFormat = 'Y-m-d H:i:s.u';

    protected $dates = [
        'dh_avaliacao'
    ];

    protected $fillable = [
        'co_representante_arquivo',
        'co_usuario_avaliador',
        'co_conselho_habilitacao',
        'st_em_conformidade',
        'ds_observacao',
        'dh_avaliacao',
    ];

    public $timestamps = false;

    public function conselhoHabilitacao()
    {
        return $this->hasOne(ConselhoHabilitacao::class,
            'co_conselho_habilitacao',
            'co_conselho_habilitacao'
        );
    }

    public function representanteArquivo()
    {
        return $this->hasOne(
            RepresentanteArquivoPivot::class,
            'co_representante_arquivo',
            'co_representante_arquivo'
        );
    }
}
