<?php

namespace App\Modules\Localizacao\Model;

use Illuminate\Database\Eloquent\Model;

class Endereco extends Model
{
    protected $table = 'tb_endereco';
    protected $primaryKey = 'co_endereco';

    protected $fillable = [
        'ds_complemento',
        'nu_cep',
        'ds_logradouro',
        'co_municipio',
    ];

    public $timestamps = false;

    public function organizacoes()
    {
        return $this->hasMany(
            \App\Modules\Organizacao\Model\Organizacao::class,
            'co_endereco',
            'co_endereco'
        );
    }

}
