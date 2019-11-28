<?php

namespace App\Modules\Conselho\Model;

use App\Modules\Conta\Model\Usuario;
use Illuminate\Database\Eloquent\Model;

class ConselhoIndicacaoHabilitacao extends Model
{
    protected $table = 'tb_conselho_indicacao_habilitacao';

    protected $primaryKey = 'co_conselho_indicacao_habilitacao';

    protected $dateFormat = 'Y-m-d H:i:s.u';

    protected $dates = [
        'dh_avaliacao',
    ];

    protected $fillable = [
        'co_conselho_indicacao_habilitacao',
        'co_indicado',
        'st_avaliacao',
        'ds_parecer',
        'co_usuario_avaliador',
        'st_revisao_final'
    ];

    public $timestamps = FALSE;

    public function recurso()
    {
        return $this->hasOne(
            ConselhoIndicacaoHabilitacaoRecurso::class,
            'co_conselho_indicacao_habilitacao',
            'co_conselho_indicacao_habilitacao'
        );
    }

    public function indicado()
    {
        return $this->hasOne(
            ConselhoIndicacao::class,
            'co_conselho_indicacao',
            'co_indicado'
        );
    }

    public function usuarioAvaliador()
    {
        return $this->hasOne(
            Usuario::class,
            'co_usuario',
            'co_usuario_avaliador'
        );
    }
}
