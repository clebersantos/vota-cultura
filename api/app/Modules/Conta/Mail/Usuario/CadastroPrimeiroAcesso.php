<?php


namespace App\Modules\Conta\Mail\Usuario;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class CadastroPrimeiroAcesso extends Mailable
{
    use Queueable,
        SerializesModels;

    protected $listaRepresentantesNaoCadastrados;

    public function build()
    {
        $linkPrimeiroAcesso = env('WEB_APP_HOST')
            . "/conta/primeiro-acesso/";
        return $this->subject('Ministério da Cidadania - Acesso ao Vota Cultura')
            ->view('conta::usuario.email.cadastro-primeiro-acesso')
            ->with([
                'linkPrimeiroAcesso' => $linkPrimeiroAcesso,
            ]);
    }
}
