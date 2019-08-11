<h1>Vota Cultura</h1>
<p>
    Seu cadastro foi realizado com sucesso!
</p>
<p>
    <b>
        CNPJ do Orgão Gestor do Conselho
    </b>
    {{ $conselho->nu_cnpj }}
</p>
<p>
    <b>
        Nome do órgão gestor de cultura
    </b>
    {{ $conselho->no_orgao_gestor }}
</p>
<p>
    <b>
        Telefone
    </b>
    {{ $conselho->telefone_formatado }}
</p>
<p>
    <b>
        E-mail
    </b>
    {{ $conselho->ds_email }}
</p>
<p>
    <b>
        Sítio eletrônico do conselho
    </b>
    {{ $conselho->ds_sitio_eletronico }}
</p>
<p>
    <b>
        CEP
    </b>
    {{ $conselho->endereco->nu_cep }}
</p>
<p>
    <b>
        Logradouro
    </b>
    {{ $conselho->endereco->ds_logradouro }}
</p>
<p>
    <b>
        Complemento
    </b>
    {{ $conselho->endereco->ds_logradouro }}
</p>
<p>
    <b>
        Unidade da Federação da Sede
    </b>
    {{ $conselho->endereco->municipio->uf->no_uf }}
</p>
<p>
    <b>
        Cidade
    </b>
    {{ $conselho->endereco->municipio->no_municipio }}
</p>
<p>
    <b>
        Nome do Representante
    </b>
    {{ $conselho->representante->no_pessoa }}
</p>
<p>
    <b>
        Celular do representante
    </b>
    {{ $conselho->representante->telefone_formatado }}
</p>
<p>
    <b>
        CPF
    </b>
    {{ $conselho->representante->nu_cpf }}
</p>
<p>
    <b>
        RG
    </b>
    {{ $conselho->representante->nu_rg }}
</p>
<p>
    <b>
        E-mail do representante:
    </b>
    {{ $conselho->representante->ds_email }}
</p>
{{--<p>--}}
{{--    <b>--}}
{{--        Critérios:--}}
{{--    </b>--}}

{{--<ul>--}}
{{--    @foreach ($conselho->criterios as $criterio)--}}
{{--        <li>{{$criterio->ds_criterio}}: {{$criterio->ds_detalhamento}}</li>--}}
{{--    @endforeach--}}
{{--</ul>--}}
{{--</p>--}}

<p>Atenciosamente,</p>
<p>Minist&eacute;rio da Cidadania</p>
