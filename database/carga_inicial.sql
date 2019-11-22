CREATE TABLE tb_arquivo
(
    co_arquivo     SERIAL,
    no_arquivo     varchar(255)              NOT NULL,
    ds_localizacao varchar(255)              NOT NULL,
    dh_insercao    date DEFAULT current_date NOT NULL,
    no_extensao    varchar(255),
    no_mime_type   varchar(50),
    CONSTRAINT pk_arquivo_coarquivo PRIMARY KEY (co_arquivo)
);


COMMENT ON COLUMN tb_arquivo.no_extensao IS 'Extensão do arquivo';

COMMENT ON COLUMN tb_arquivo.no_mime_type IS 'MIME Type do arquivo';

COMMENT ON COLUMN tb_arquivo.co_arquivo IS 'chave primária da tabela';

COMMENT ON COLUMN tb_arquivo.no_arquivo IS 'nome do arquivo inserido';

COMMENT ON COLUMN tb_arquivo.ds_localizacao IS 'path do arquivo no sistema de arquivos';

COMMENT ON COLUMN tb_arquivo.dh_insercao IS 'data da inserção do arquivo';

CREATE TABLE tb_criterio
(
    co_criterio     SERIAL,
    tp_criterio     varchar(100) NOT NULL,
    ds_criterio     varchar(150) NOT NULL,
    ds_detalhamento varchar(255) NOT NULL,
    qt_pontuacao    integer      NOT NULL,
    qt_peso         integer      NOT NULL,
    CONSTRAINT pk_criterio_cocriterio PRIMARY KEY (co_criterio)
);

COMMENT ON COLUMN tb_criterio.co_criterio IS 'chave primária da tabela';

COMMENT ON COLUMN tb_criterio.tp_criterio IS 'slug do critério';

COMMENT ON COLUMN tb_criterio.ds_criterio IS 'texto descritivo de qual será o critério';

COMMENT ON COLUMN tb_criterio.ds_detalhamento IS 'texto descritivo de cada opção de acordo com o critério';

COMMENT ON COLUMN tb_criterio.qt_pontuacao IS 'pontuação referente ao detalhamento do critério';

COMMENT ON COLUMN tb_criterio.qt_peso IS 'peso da pontuação';

CREATE TABLE tb_cronograma
(
    co_cronograma SERIAL,
    tp_cronograma varchar(100) NOT NULL,
    dh_inicio     timestamp    NOT NULL,
    dh_fim        timestamp    NOT NULL,
    CONSTRAINT pk_tb_cronograma_co_cronograma PRIMARY KEY (co_cronograma)
);

COMMENT ON COLUMN tb_cronograma.co_cronograma IS 'chave primária da tabela';

COMMENT ON COLUMN tb_cronograma.tp_cronograma IS 'slug do cronograma agendado';

COMMENT ON COLUMN tb_cronograma.dh_inicio IS 'data de inicío do evento cadastrado';

COMMENT ON COLUMN tb_cronograma.dh_fim IS 'data de fim do evento cadastrado';

CREATE TABLE tb_perfil
(
    co_perfil SERIAL,
    no_perfil varchar(255) NOT NULL,
    ds_perfil varchar(255) NOT NULL,
    st_ativo  bool         NOT NULL,
    CONSTRAINT pk_perfil_coperfil PRIMARY KEY (co_perfil)
);

COMMENT ON COLUMN tb_perfil.co_perfil IS 'chave primária da tabela';

COMMENT ON COLUMN tb_perfil.no_perfil IS 'nome do perfil';

COMMENT ON COLUMN tb_perfil.ds_perfil IS 'descrição do perfil';

COMMENT ON COLUMN tb_perfil.st_ativo IS 'opções:\n\nTrue - Ativo\nFalse - Inativo';

CREATE TABLE tb_representante
(
    co_representante SERIAL,
    ds_email         varchar(255) NOT NULL,
    no_pessoa        varchar(100) NOT NULL,
    nu_rg            varchar(9)   NOT NULL,
    nu_cpf           varchar(11)  NOT NULL,
    nu_telefone      varchar(11)  NOT NULL,
    CONSTRAINT pk_tb_representante_co_representante PRIMARY KEY (co_representante),
    CONSTRAINT uk_01_representante_cpf UNIQUE (nu_cpf)
);

COMMENT ON COLUMN tb_representante.co_representante IS 'chave primária da tabela';

COMMENT ON COLUMN tb_representante.ds_email IS 'email do representante';

COMMENT ON COLUMN tb_representante.no_pessoa IS 'nome do representante';

COMMENT ON COLUMN tb_representante.nu_rg IS 'número do RG do representante';

COMMENT ON COLUMN tb_representante.nu_cpf IS 'número de cpf do representante';

CREATE TABLE tb_segmento
(
    co_segmento     SERIAL,
    tp_segmento     varchar(100) NOT NULL,
    ds_detalhamento varchar(255) NOT NULL,
    st_ativo        bool         NOT NULL,
    CONSTRAINT pk_segmento_codsegmento PRIMARY KEY (co_segmento)
);

COMMENT ON COLUMN tb_segmento.co_segmento IS 'chave primária da tabela';

COMMENT ON COLUMN tb_segmento.tp_segmento IS 'slug do tipo de segmento';

COMMENT ON COLUMN tb_segmento.ds_detalhamento IS 'descrição do tipo de segmento\n(ex: Culturas dos povos indígenas)';

COMMENT ON COLUMN tb_segmento.st_ativo IS 'campo de habilitação/desabilitação do tipo de segmento';

CREATE TABLE tb_tipo_voto
(
    co_tipo_voto    SERIAL,
    ds_detalhamento varchar(100) NOT NULL,
    st_ativo        bool         NOT NULL,
    CONSTRAINT pk_tipovoto_cotipovoto PRIMARY KEY (co_tipo_voto)
);

COMMENT ON COLUMN tb_tipo_voto.co_tipo_voto IS 'chave primária da tabela';

COMMENT ON COLUMN tb_tipo_voto.ds_detalhamento IS 'descrição do tipo de voto que foi feito';

COMMENT ON COLUMN tb_tipo_voto.st_ativo IS 'campo de habilitação/desabilitação do tipo de voto';

CREATE TABLE tb_uf
(
    co_ibge integer     NOT NULL,
    sg_uf   char(2)     NOT NULL,
    no_uf   varchar(50) NOT NULL,
    CONSTRAINT pk_uf_coibge PRIMARY KEY (co_ibge)
);

COMMENT ON COLUMN tb_uf.co_ibge IS 'chave primária da tabela';

COMMENT ON COLUMN tb_uf.sg_uf IS 'sigla da unidade federativa';

COMMENT ON COLUMN tb_uf.no_uf IS 'nome da unidade federativa';

CREATE TABLE tb_usuario
(
    co_usuario            SERIAL,
    no_nome               varchar(255) NOT NULL,
    st_ativo              bool         NOT NULL,
    ds_email              varchar(50)  NOT NULL,
    ds_senha              varchar(255) NOT NULL,
    dh_cadastro           date         NOT NULL,
    dh_ultima_atualizacao date         NOT NULL,
    ds_codigo_ativacao    varchar(255) NOT NULL,
    co_perfil             integer,
    nu_cpf                varchar(11)  NOT NULL,
    CONSTRAINT pk_usuario_cousuario PRIMARY KEY (co_usuario),
    CONSTRAINT unq_tb_usuario_nu_cpf UNIQUE (nu_cpf)
);

COMMENT ON COLUMN tb_usuario.co_usuario IS 'chave primária da tabela';

COMMENT ON COLUMN tb_usuario.no_nome IS 'nome do usuario';

COMMENT ON COLUMN tb_usuario.st_ativo IS 'situação do usuario\n\nTrue = Ativo\nFalse = Inativo';

COMMENT ON COLUMN tb_usuario.ds_email IS 'email do usuario';

COMMENT ON COLUMN tb_usuario.ds_senha IS 'senha do usuario';

COMMENT ON COLUMN tb_usuario.dh_cadastro IS 'data do cadastro do usuario';

COMMENT ON COLUMN tb_usuario.dh_ultima_atualizacao IS 'data da ultima alteração do usuario';

COMMENT ON COLUMN tb_usuario.ds_codigo_ativacao IS 'código para ativação do cadastro do usuario';

COMMENT ON COLUMN tb_usuario.co_perfil IS 'perfil do usuario';

COMMENT ON COLUMN tb_usuario.nu_cpf IS 'número de cpf do representante';

CREATE TABLE tb_versionamento
(
    co_versionamento SERIAL,
    dt_versao        date         NOT NULL,
    co_versao        char(20)     NOT NULL,
    ds_alteracao     varchar(400) NOT NULL,
    no_modulo        varchar(100) NOT NULL,
    CONSTRAINT pk_tb_versionamento_co_versionamento PRIMARY KEY (co_versionamento)
);

CREATE TABLE tb_voto
(
    co_voto      SERIAL,
    dh_voto      date DEFAULT current_date NOT NULL,
    co_tipo_voto integer                   NOT NULL,
    co_usuario   integer                   NOT NULL,
    CONSTRAINT pk_voto_covoto PRIMARY KEY (co_voto),
    CONSTRAINT fk_voto_usuario FOREIGN KEY (co_usuario) REFERENCES tb_usuario (co_usuario),
    CONSTRAINT fk_voto_tipovoto FOREIGN KEY (co_tipo_voto) REFERENCES tb_tipo_voto (co_tipo_voto)
);

COMMENT ON COLUMN tb_voto.co_voto IS 'chave primária da tabela';

COMMENT ON COLUMN tb_voto.dh_voto IS 'data e hora de quando o voto foi feito';

COMMENT ON COLUMN tb_voto.co_tipo_voto IS 'chave estrangeira para o tipo de votação feita';

COMMENT ON COLUMN tb_voto.co_usuario IS 'chave estrangeira com o usuario que votou';

CREATE TABLE rl_representante_arquivo
(
    co_representante_arquivo SERIAL,
    co_representante         integer      NOT NULL,
    co_arquivo               integer      NOT NULL,
    tp_arquivo               varchar(100) NOT NULL,
    tp_inscricao             char(1)      NOT NULL,
    CONSTRAINT pk_representante_arquivo_corepresentantearquivo PRIMARY KEY (co_representante_arquivo),
    CONSTRAINT fk_representantearquivo_representante FOREIGN KEY (co_representante) REFERENCES tb_representante (co_representante),
    CONSTRAINT fk_representantearquivo_arquivo FOREIGN KEY (co_arquivo) REFERENCES tb_arquivo (co_arquivo)
);

CREATE INDEX unq_rl_representante_arquivo_fk_representante ON rl_representante_arquivo (co_representante);

COMMENT ON COLUMN rl_representante_arquivo.co_representante IS 'chave estrangeira ligando a um representante, que inseriu um arquivo';

COMMENT ON COLUMN rl_representante_arquivo.co_arquivo IS 'chave estrangeira ligando a um arquivo inserido';

COMMENT ON COLUMN rl_representante_arquivo.tp_arquivo IS 'opcoes:\n\ndeclaracao_representante\ndocumento_identificacao\ndocumento_cpf\nato_normativo\nata_reuniao\ndeclaracao_ciencia';

COMMENT ON COLUMN rl_representante_arquivo.tp_inscricao IS '1 - Organização\n2 - Conselho';

CREATE TABLE rl_usuario_perfil
(
    co_usuario_perfil SERIAL,
    co_usuario        integer NOT NULL,
    co_perfil         integer NOT NULL,
    CONSTRAINT pk_usuarioperfil_cousuarioperfil PRIMARY KEY (co_usuario_perfil),
    CONSTRAINT unq_rl_usuario_perfil_co_usuario UNIQUE (co_usuario),
    CONSTRAINT fk_usuarioperfil_usuario FOREIGN KEY (co_usuario) REFERENCES tb_usuario (co_usuario),
    CONSTRAINT fk_usuarioperfil_perfil FOREIGN KEY (co_perfil) REFERENCES tb_perfil (co_perfil)
);

COMMENT ON TABLE rl_usuario_perfil IS 'tabela de relacionamento entre usuario e perfil';

COMMENT ON COLUMN rl_usuario_perfil.co_usuario_perfil IS 'chave primária da tabela';

COMMENT ON COLUMN rl_usuario_perfil.co_usuario IS 'código do usuario';

COMMENT ON COLUMN rl_usuario_perfil.co_perfil IS 'código do perfil';

COMMENT ON CONSTRAINT fk_usuarioperfil_usuario ON rl_usuario_perfil IS 'relacionamento para tabela de usuario';

COMMENT ON CONSTRAINT fk_usuarioperfil_perfil ON rl_usuario_perfil IS 'chave estrangeira para tabela perfil';

CREATE TABLE tb_municipio
(
    co_municipio integer     NOT NULL,
    no_municipio varchar(50) NOT NULL,
    co_uf        integer     NOT NULL,
    CONSTRAINT pk_municipio_comunicipio PRIMARY KEY (co_municipio),
    CONSTRAINT fk_municipio_uf FOREIGN KEY (co_uf) REFERENCES tb_uf (co_ibge)
);

COMMENT ON COLUMN tb_municipio.co_municipio IS 'chave primaria da tabela, código da base do IBGE';

COMMENT ON COLUMN tb_municipio.no_municipio IS 'nome do município';

COMMENT ON COLUMN tb_municipio.co_uf IS 'chave estrangeira para tabela de uf';

CREATE TABLE tb_endereco
(
    co_endereco    SERIAL,
    ds_complemento varchar(255),
    nu_cep         varchar(8)   NOT NULL,
    ds_logradouro  varchar(255) NOT NULL,
    co_municipio   integer      NOT NULL,
    CONSTRAINT pk_endereco_coendereco PRIMARY KEY (co_endereco),
    CONSTRAINT fk_endereco_municipio FOREIGN KEY (co_municipio) REFERENCES tb_municipio (co_municipio)
);

COMMENT ON COLUMN tb_endereco.co_endereco IS 'chave primária da tabela';

COMMENT ON COLUMN tb_endereco.ds_complemento IS 'completo do endereço';

COMMENT ON COLUMN tb_endereco.nu_cep IS 'número do cep';

COMMENT ON COLUMN tb_endereco.ds_logradouro IS 'descrição do logradouro';

COMMENT ON COLUMN tb_endereco.co_municipio IS 'chave estrangeira para tabela que possui dados do ibge';

CREATE TABLE tb_organizacao
(
    co_organizacao      SERIAL,
    nu_cnpj             varchar(14)  NOT NULL,
    no_organizacao      varchar(100) NOT NULL,
    ds_email            varchar(100) NOT NULL,
    nu_telefone         varchar(11)  NOT NULL,
    co_segmento         integer      NOT NULL,
    co_usuario          integer,
    co_endereco         integer      NOT NULL,
    co_representante    integer      NOT NULL,
    ds_sitio_eletronico varchar(255),
    st_inscricao        char(1)      NOT NULL,
    CONSTRAINT pk_organizacao_codorganizacao PRIMARY KEY (co_organizacao),
    CONSTRAINT fk_organizacao_segmento FOREIGN KEY (co_segmento) REFERENCES tb_segmento (co_segmento),
    CONSTRAINT fk_organizacao_usuario FOREIGN KEY (co_usuario) REFERENCES tb_usuario (co_usuario),
    CONSTRAINT fk_organizacao_endereco FOREIGN KEY (co_endereco) REFERENCES tb_endereco (co_endereco),
    CONSTRAINT fk_organizacao_representante FOREIGN KEY (co_representante) REFERENCES tb_representante (co_representante)
);

COMMENT ON COLUMN tb_organizacao.co_organizacao IS 'chave primária da tabela';

COMMENT ON COLUMN tb_organizacao.nu_cnpj IS 'CNPJ do Órgão Gestor/Organização';

COMMENT ON COLUMN tb_organizacao.no_organizacao IS 'Nome da organização';

COMMENT ON COLUMN tb_organizacao.ds_email IS 'Email para contato com a organização';

COMMENT ON COLUMN tb_organizacao.nu_telefone IS 'número de telefone para contato com a organização';

COMMENT ON COLUMN tb_organizacao.co_segmento IS 'Chave estrangeira com tabela de dados dos segmento no qual a organização ou entidade cultural pretende concorrer';

COMMENT ON COLUMN tb_organizacao.co_usuario IS 'Chave estrangeira com o usuario que vai gerenciar a organização';

COMMENT ON COLUMN tb_organizacao.co_endereco IS 'Chave estrangeira com os dados do endereço da organização';

COMMENT ON COLUMN tb_organizacao.co_representante IS 'chave estrangeira com os dados do representante legal da organização ou entidade cultural';

COMMENT ON COLUMN tb_organizacao.ds_sitio_eletronico IS 'Descrição do sítio eletrônico da organização ou entidade cultural, caso o mesmo possua';

COMMENT ON COLUMN tb_organizacao.st_inscricao IS 'Situação da inscrição da organização';

CREATE TABLE rl_organizacao_criterio
(
    co_organizacao_criterio SERIAL,
    co_criterio             integer NOT NULL,
    co_organizacao          integer NOT NULL,
    CONSTRAINT orgao_criterio_coorganizacaociterio PRIMARY KEY (co_organizacao_criterio),
    CONSTRAINT fk_criterio_organizacao FOREIGN KEY (co_criterio) REFERENCES tb_criterio (co_criterio),
    CONSTRAINT fk_organizacao_criterio FOREIGN KEY (co_organizacao) REFERENCES tb_organizacao (co_organizacao)
);

COMMENT ON COLUMN rl_organizacao_criterio.co_organizacao_criterio IS 'chave primária da tabela';

COMMENT ON COLUMN rl_organizacao_criterio.co_criterio IS 'chave estrangeira ligando a um criterio';

COMMENT ON COLUMN rl_organizacao_criterio.co_organizacao IS 'chave estrangeira ligando a uma organização';

CREATE TABLE tb_conselho
(
    co_conselho         SERIAL,
    no_orgao_gestor     varchar(150) NOT NULL,
    no_conselho         varchar(250) NOT NULL,
    ds_email            varchar(50)  NOT NULL,
    nu_telefone         varchar(11)  NOT NULL,
    nu_cnpj             varchar(14)  NOT NULL,
    tp_governamental    char(1)      NOT NULL,
    co_endereco         integer      NOT NULL,
    co_representante    integer      NOT NULL,
    co_usuario          integer,
    ds_sitio_eletronico varchar(255),
    st_inscricao        char(1)      NOT NULL,
    CONSTRAINT pk_conselho_coconselho PRIMARY KEY (co_conselho),
    CONSTRAINT fk_conselho_endereco FOREIGN KEY (co_endereco) REFERENCES tb_endereco (co_endereco),
    CONSTRAINT fk_conselho_representante FOREIGN KEY (co_representante) REFERENCES tb_representante (co_representante),
    CONSTRAINT fk_conselho_usuario FOREIGN KEY (co_usuario) REFERENCES tb_usuario (co_usuario)
);

COMMENT ON COLUMN tb_conselho.co_conselho IS 'chave primária da tabela';

COMMENT ON COLUMN tb_conselho.no_orgao_gestor IS 'nome do Orgão gestor do conselho';

COMMENT ON COLUMN tb_conselho.no_orgao_gestor IS 'Nome do conselho de cultura';

COMMENT ON COLUMN tb_conselho.ds_email IS 'email para contato com o conselho';

COMMENT ON COLUMN tb_conselho.nu_telefone IS 'telefone para contato ao conselho';

COMMENT ON COLUMN tb_conselho.nu_cnpj IS 'CNPJ do Órgão Gestor/Organização';

COMMENT ON COLUMN tb_conselho.tp_governamental IS 'opções:\n(E)stadual\n(C)apital';

COMMENT ON COLUMN tb_conselho.co_endereco IS 'endereço do conselho';

COMMENT ON COLUMN tb_conselho.co_representante IS 'representante principal do conselho';

COMMENT ON COLUMN tb_conselho.co_usuario IS 'chave primária do usuario que terá posse do conselho';

COMMENT ON COLUMN tb_conselho.ds_sitio_eletronico IS 'endereço eletrônico do conselho';

COMMENT ON COLUMN tb_conselho.st_inscricao IS 'situação em que se encontra a inscrição';

CREATE TABLE tb_eleitor
(
    co_eleitor     SERIAL,
    nu_cpf         varchar(11)        NOT NULL,
    no_nome        varchar(255)       NOT NULL,
    nu_rg          varchar(9)         NOT NULL,
    dt_nascimento  date               NOT NULL,
    st_estrangeiro bool DEFAULT false NOT NULL,
    co_ibge        integer            NOT NULL,
    co_usuario     integer,
    ds_email       varchar(255)       NOT NULL,
    CONSTRAINT pk_eleitor_codeleitor PRIMARY KEY (co_eleitor),
    CONSTRAINT fk_eleitor_tb_uf FOREIGN KEY (co_ibge) REFERENCES tb_uf (co_ibge),
    CONSTRAINT fk_eleitor_usuario FOREIGN KEY (co_usuario) REFERENCES tb_usuario (co_usuario)
);

COMMENT ON COLUMN tb_eleitor.co_eleitor IS 'chave primária da tabela';

COMMENT ON COLUMN tb_eleitor.nu_cpf IS 'número de CPF do eleitor';

COMMENT ON COLUMN tb_eleitor.no_nome IS 'nome do eleitor';

COMMENT ON COLUMN tb_eleitor.nu_rg IS 'numero do RG do eleitor';

COMMENT ON COLUMN tb_eleitor.dt_nascimento IS 'data nascimento do eleitor';

COMMENT ON COLUMN tb_eleitor.st_estrangeiro IS 'Situação se o eleitor é estrangeiro ou não\n\nTrue = É estrangeiro\nFalse = É Brasileiro';

COMMENT ON COLUMN tb_eleitor.co_ibge IS 'chave estrangeira com os dados de UF';

COMMENT ON COLUMN tb_eleitor.co_usuario IS 'chave estrangeira com o usuario para login do inscrito para eleitor';

COMMENT ON COLUMN tb_eleitor.ds_email IS 'email do eleitor';

CREATE TABLE rl_eleitor_arquivo
(
    co_eleitor_arquivo SERIAL,
    co_eleitor         integer      NOT NULL,
    co_arquivo         integer      NOT NULL,
    tp_arquivo         varchar(100) NOT NULL,
    CONSTRAINT pk_eleitor_arquivo_coeleitorarquivo PRIMARY KEY (co_eleitor_arquivo),
    CONSTRAINT fk_eleitorarquivo_eleitor FOREIGN KEY (co_eleitor) REFERENCES tb_eleitor (co_eleitor),
    CONSTRAINT fk_eleitorarquivo_arquivo FOREIGN KEY (co_arquivo) REFERENCES tb_arquivo (co_arquivo)
);

CREATE INDEX unq_rl_eleitor_arquivo_fk_eleitor ON rl_eleitor_arquivo (co_eleitor);

COMMENT ON COLUMN rl_eleitor_arquivo.co_eleitor IS 'chave estrangeira ligando a um eleitor, que inseriu um arquivo';

COMMENT ON COLUMN rl_eleitor_arquivo.co_arquivo IS 'chave estrangeira ligando a um arquivo inserido';

COMMENT ON COLUMN rl_eleitor_arquivo.tp_arquivo IS 'opcoes:\n\ndeclaracao_eleitor\ndocumento_identificacao\ndocumento_cpf\nato_normativo\nata_reuniao\ndeclaracao_ciencia';

-- carga_ufs
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (11, 'RO', 'Rondônia');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (12, 'AC', 'Acre');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (13, 'AM', 'Amazonas');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (14, 'RR', 'Roraima');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (15, 'PA', 'Pará');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (16, 'AP', 'Amapá');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (17, 'TO', 'Tocantins');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (21, 'MA', 'Maranhão');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (22, 'PI', 'Piauí');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (23, 'CE', 'Ceará');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (24, 'RN', 'Rio Grande do Norte');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (25, 'PB', 'Paraíba');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (26, 'PE', 'Pernambuco');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (27, 'AL', 'Alagoas');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (28, 'SE', 'Sergipe');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (29, 'BA', 'Bahia');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (31, 'MG', 'Minas Gerais');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (32, 'ES', 'Espírito Santo');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (33, 'RJ', 'Rio de Janeiro');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (35, 'SP', 'São Paulo');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (41, 'PR', 'Paraná');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (42, 'SC', 'Santa Catarina');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (43, 'RS', 'Rio Grande do Sul');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (50, 'MS', 'Mato Grosso do Sul');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (51, 'MT', 'Mato Grosso');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (52, 'GO', 'Goiás');
INSERT INTO tb_uf(co_ibge, sg_uf, no_uf)
VALUES (53, 'DF', 'Distrito Federal');

-- carga municipios
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110001, 'Alta Floresta D''Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110002, 'Ariquemes', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110003, 'Cabixi', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110004, 'Cacoal', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110005, 'Cerejeiras', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110006, 'Colorado do Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110007, 'Corumbiara', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110008, 'Costa Marques', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110009, 'Espigão D''Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110010, 'Guajará-Mirim', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110011, 'Jaru', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110012, 'Ji-Paraná', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110013, 'Machadinho D''Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110014, 'Nova Brasilândia D''Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110015, 'Ouro Preto do Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110018, 'Pimenta Bueno', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110020, 'Porto Velho', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110025, 'Presidente Médici', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110026, 'Rio Crespo', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110028, 'Rolim de Moura', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110029, 'Santa Luzia D''Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110030, 'Vilhena', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110032, 'São Miguel do Guaporé', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110033, 'Nova Mamoré', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110034, 'Alvorada D''Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110037, 'Alto Alegre dos Parecis', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110040, 'Alto Paraíso', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110045, 'Buritis', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110050, 'Novo Horizonte do Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110060, 'Cacaulândia', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110070, 'Campo Novo de Rondônia', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110080, 'Candeias do Jamari', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110090, 'Castanheiras', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110092, 'Chupinguaia', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110094, 'Cujubim', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110100, 'Governador Jorge Teixeira', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110110, 'Itapuã do Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110120, 'Ministro Andreazza', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110130, 'Mirante da Serra', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110140, 'Monte Negro', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110143, 'Nova União', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110145, 'Parecis', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110146, 'Pimenteiras do Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110147, 'Primavera de Rondônia', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110148, 'São Felipe D''Oeste', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110149, 'São Francisco do Guaporé', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110150, 'Seringueiras', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110155, 'Teixeirópolis', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110160, 'Theobroma', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110170, 'Urupá', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110175, 'Vale do Anari', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (110180, 'Vale do Paraíso', 11);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120001, 'Acrelândia', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120005, 'Assis Brasil', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120010, 'Brasiléia', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120013, 'Bujari', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120017, 'Capixaba', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120020, 'Cruzeiro do Sul', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120025, 'Epitaciolândia', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120030, 'Feijó', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120032, 'Jordão', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120033, 'Mâncio Lima', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120034, 'Manoel Urbano', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120035, 'Marechal Thaumaturgo', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120038, 'Plácido de Castro', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120039, 'Porto Walter', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120040, 'Rio Branco', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120042, 'Rodrigues Alves', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120043, 'Santa Rosa do Purus', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120045, 'Senador Guiomard', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120050, 'Sena Madureira', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120060, 'Tarauacá', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120070, 'Xapuri', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (120080, 'Porto Acre', 12);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130002, 'Alvarães', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130006, 'Amaturá', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130008, 'Anamã', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130010, 'Anori', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130014, 'Apuí', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130020, 'Atalaia do Norte', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130030, 'Autazes', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130040, 'Barcelos', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130050, 'Barreirinha', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130060, 'Benjamin Constant', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130063, 'Beruri', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130068, 'Boa Vista do Ramos', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130070, 'Boca do Acre', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130080, 'Borba', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130083, 'Caapiranga', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130090, 'Canutama', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130100, 'Carauari', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130110, 'Careiro', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130115, 'Careiro da Várzea', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130120, 'Coari', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130130, 'Codajás', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130140, 'Eirunepé', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130150, 'Envira', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130160, 'Fonte Boa', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130165, 'Guajará', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130170, 'Humaitá', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130180, 'Ipixuna', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130185, 'Iranduba', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130190, 'Itacoatiara', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130195, 'Itamarati', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130200, 'Itapiranga', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130210, 'Japurá', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130220, 'Juruá', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130230, 'Jutaí', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130240, 'Lábrea', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130250, 'Manacapuru', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130255, 'Manaquiri', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130260, 'Manaus', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130270, 'Manicoré', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130280, 'Maraã', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130290, 'Maués', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130300, 'Nhamundá', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130310, 'Nova Olinda do Norte', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130320, 'Novo Airão', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130330, 'Novo Aripuanã', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130340, 'Parintins', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130350, 'Pauini', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130353, 'Presidente Figueiredo', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130356, 'Rio Preto da Eva', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130360, 'Santa Isabel do Rio Negro', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130370, 'Santo Antônio do Içá', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130380, 'São Gabriel da Cachoeira', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130390, 'São Paulo de Olivença', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130395, 'São Sebastião do Uatumã', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130400, 'Silves', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130406, 'Tabatinga', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130410, 'Tapauá', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130420, 'Tefé', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130423, 'Tonantins', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130426, 'Uarini', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130430, 'Urucará', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (130440, 'Urucurituba', 13);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140002, 'Amajari', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140005, 'Alto Alegre', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140010, 'Boa Vista', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140015, 'Bonfim', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140017, 'Cantá', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140020, 'Caracaraí', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140023, 'Caroebe', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140028, 'Iracema', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140030, 'Mucajaí', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140040, 'Normandia', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140045, 'Pacaraima', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140047, 'Rorainópolis', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140050, 'São João da Baliza', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140060, 'São Luiz', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (140070, 'Uiramutã', 14);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150010, 'Abaetetuba', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150013, 'Abel Figueiredo', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150020, 'Acará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150030, 'Afuá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150034, 'Água Azul do Norte', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150040, 'Alenquer', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150050, 'Almeirim', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150060, 'Altamira', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150070, 'Anajás', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150080, 'Ananindeua', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150085, 'Anapu', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150090, 'Augusto Corrêa', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150095, 'Aurora do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150100, 'Aveiro', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150110, 'Bagre', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150120, 'Baião', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150125, 'Bannach', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150130, 'Barcarena', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150140, 'Belém', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150145, 'Belterra', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150150, 'Benevides', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150157, 'Bom Jesus do Tocantins', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150160, 'Bonito', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150170, 'Bragança', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150172, 'Brasil Novo', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150175, 'Brejo Grande do Araguaia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150178, 'Breu Branco', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150180, 'Breves', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150190, 'Bujaru', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150195, 'Cachoeira do Piriá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150200, 'Cachoeira do Arari', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150210, 'Cametá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150215, 'Canaã dos Carajás', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150220, 'Capanema', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150230, 'Capitão Poço', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150240, 'Castanhal', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150250, 'Chaves', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150260, 'Colares', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150270, 'Conceição do Araguaia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150275, 'Concórdia do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150276, 'Cumaru do Norte', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150277, 'Curionópolis', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150280, 'Curralinho', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150285, 'Curuá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150290, 'Curuçá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150293, 'Dom Eliseu', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150295, 'Eldorado dos Carajás', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150300, 'Faro', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150304, 'Floresta do Araguaia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150307, 'Garrafão do Norte', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150309, 'Goianésia do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150310, 'Gurupá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150320, 'Igarapé-Açu', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150330, 'Igarapé-Miri', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150340, 'Inhangapi', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150345, 'Ipixuna do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150350, 'Irituia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150360, 'Itaituba', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150370, 'Itupiranga', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150375, 'Jacareacanga', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150380, 'Jacundá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150390, 'Juruti', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150400, 'Limoeiro do Ajuru', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150405, 'Mãe do Rio', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150410, 'Magalhães Barata', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150420, 'Marabá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150430, 'Maracanã', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150440, 'Marapanim', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150442, 'Marituba', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150445, 'Medicilândia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150450, 'Melgaço', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150460, 'Mocajuba', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150470, 'Moju', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150480, 'Monte Alegre', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150490, 'Muaná', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150495, 'Nova Esperança do Piriá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150497, 'Nova Ipixuna', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150500, 'Nova Timboteua', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150503, 'Novo Progresso', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150506, 'Novo Repartimento', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150510, 'Óbidos', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150520, 'Oeiras do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150530, 'Oriximiná', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150540, 'Ourém', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150543, 'Ourilândia do Norte', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150548, 'Pacajá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150549, 'Palestina do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150550, 'Paragominas', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150553, 'Parauapebas', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150555, 'Pau D''Arco', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150560, 'Peixe-Boi', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150563, 'Piçarra', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150565, 'Placas', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150570, 'Ponta de Pedras', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150580, 'Portel', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150590, 'Porto de Moz', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150600, 'Prainha', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150610, 'Primavera', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150611, 'Quatipuru', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150613, 'Redenção', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150616, 'Rio Maria', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150618, 'Rondon do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150619, 'Rurópolis', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150620, 'Salinópolis', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150630, 'Salvaterra', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150635, 'Santa Bárbara do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150640, 'Santa Cruz do Arari', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150650, 'Santa Isabel do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150655, 'Santa Luzia do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150658, 'Santa Maria das Barreiras', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150660, 'Santa Maria do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150670, 'Santana do Araguaia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150680, 'Santarém', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150690, 'Santarém Novo', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150700, 'Santo Antônio do Tauá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150710, 'São Caetano de Odivelas', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150715, 'São Domingos do Araguaia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150720, 'São Domingos do Capim', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150730, 'São Félix do Xingu', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150740, 'São Francisco do Pará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150745, 'São Geraldo do Araguaia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150746, 'São João da Ponta', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150747, 'São João de Pirabas', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150750, 'São João do Araguaia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150760, 'São Miguel do Guamá', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150770, 'São Sebastião da Boa Vista', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150775, 'Sapucaia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150780, 'Senador José Porfírio', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150790, 'Soure', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150795, 'Tailândia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150796, 'Terra Alta', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150797, 'Terra Santa', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150800, 'Tomé-Açu', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150803, 'Tracuateua', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150805, 'Trairão', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150808, 'Tucumã', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150810, 'Tucuruí', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150812, 'Ulianópolis', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150815, 'Uruará', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150820, 'Vigia', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150830, 'Viseu', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150835, 'Vitória do Xingu', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (150840, 'Xinguara', 15);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160005, 'Serra do Navio', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160010, 'Amapá', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160015, 'Pedra Branca do Amapari', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160020, 'Calçoene', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160021, 'Cutias', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160023, 'Ferreira Gomes', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160025, 'Itaubal', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160027, 'Laranjal do Jari', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160030, 'Macapá', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160040, 'Mazagão', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160050, 'Oiapoque', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160053, 'Porto Grande', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160055, 'Pracuúba', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160060, 'Santana', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160070, 'Tartarugalzinho', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (160080, 'Vitória do Jari', 16);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170025, 'Abreulândia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170030, 'Aguiarnópolis', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170035, 'Aliança do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170040, 'Almas', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170070, 'Alvorada', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170100, 'Ananás', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170105, 'Angico', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170110, 'Aparecida do Rio Negro', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170130, 'Aragominas', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170190, 'Araguacema', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170200, 'Araguaçu', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170210, 'Araguaína', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170215, 'Araguanã', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170220, 'Araguatins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170230, 'Arapoema', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170240, 'Arraias', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170255, 'Augustinópolis', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170270, 'Aurora do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170290, 'Axixá do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170300, 'Babaçulândia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170305, 'Bandeirantes do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170307, 'Barra do Ouro', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170310, 'Barrolândia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170320, 'Bernardo Sayão', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170330, 'Bom Jesus do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170360, 'Brasilândia do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170370, 'Brejinho de Nazaré', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170380, 'Buriti do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170382, 'Cachoeirinha', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170384, 'Campos Lindos', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170386, 'Cariri do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170388, 'Carmolândia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170389, 'Carrasco Bonito', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170390, 'Caseara', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170410, 'Centenário', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170460, 'Chapada de Areia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170510, 'Chapada da Natividade', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170550, 'Colinas do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170555, 'Combinado', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170560, 'Conceição do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170600, 'Couto Magalhães', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170610, 'Cristalândia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170625, 'Crixás do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170650, 'Darcinópolis', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170700, 'Dianópolis', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170710, 'Divinópolis do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170720, 'Dois Irmãos do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170730, 'Dueré', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170740, 'Esperantina', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170755, 'Fátima', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170765, 'Figueirópolis', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170770, 'Filadélfia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170820, 'Formoso do Araguaia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170825, 'Fortaleza do Tabocão', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170830, 'Goianorte', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170900, 'Goiatins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170930, 'Guaraí', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170950, 'Gurupi', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (170980, 'Ipueiras', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171050, 'Itacajá', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171070, 'Itaguatins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171090, 'Itapiratins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171110, 'Itaporã do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171150, 'Jaú do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171180, 'Juarina', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171190, 'Lagoa da Confusão', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171195, 'Lagoa do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171200, 'Lajeado', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171215, 'Lavandeira', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171240, 'Lizarda', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171245, 'Luzinópolis', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171250, 'Marianópolis do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171270, 'Mateiros', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171280, 'Maurilândia do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171320, 'Miracema do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171330, 'Miranorte', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171360, 'Monte do Carmo', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171370, 'Monte Santo do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171380, 'Palmeiras do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171395, 'Muricilândia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171420, 'Natividade', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171430, 'Nazaré', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171488, 'Nova Olinda', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171500, 'Nova Rosalândia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171510, 'Novo Acordo', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171515, 'Novo Alegre', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171525, 'Novo Jardim', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171550, 'Oliveira de Fátima', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171570, 'Palmeirante', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171575, 'Palmeirópolis', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171610, 'Paraíso do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171620, 'Paranã', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171630, 'Pau D''Arco', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171650, 'Pedro Afonso', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171660, 'Peixe', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171665, 'Pequizeiro', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171670, 'Colméia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171700, 'Pindorama do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171720, 'Piraquê', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171750, 'Pium', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171780, 'Ponte Alta do Bom Jesus', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171790, 'Ponte Alta do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171800, 'Porto Alegre do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171820, 'Porto Nacional', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171830, 'Praia Norte', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171840, 'Presidente Kennedy', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171845, 'Pugmil', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171850, 'Recursolândia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171855, 'Riachinho', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171865, 'Rio da Conceição', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171870, 'Rio dos Bois', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171875, 'Rio Sono', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171880, 'Sampaio', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171884, 'Sandolândia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171886, 'Santa Fé do Araguaia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171888, 'Santa Maria do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171889, 'Santa Rita do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171890, 'Santa Rosa do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (171900, 'Santa Tereza do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172000, 'Santa Terezinha do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172010, 'São Bento do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172015, 'São Félix do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172020, 'São Miguel do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172025, 'São Salvador do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172030, 'São Sebastião do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172049, 'São Valério', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172065, 'Silvanópolis', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172080, 'Sítio Novo do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172085, 'Sucupira', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172090, 'Taguatinga', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172093, 'Taipas do Tocantins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172097, 'Talismã', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172100, 'Palmas', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172110, 'Tocantínia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172120, 'Tocantinópolis', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172125, 'Tupirama', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172130, 'Tupiratins', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172208, 'Wanderlândia', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (172210, 'Xambioá', 17);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210005, 'Açailândia', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210010, 'Afonso Cunha', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210015, 'Água Doce do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210020, 'Alcântara', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210030, 'Aldeias Altas', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210040, 'Altamira do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210043, 'Alto Alegre do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210047, 'Alto Alegre do Pindaré', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210050, 'Alto Parnaíba', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210055, 'Amapá do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210060, 'Amarante do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210070, 'Anajatuba', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210080, 'Anapurus', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210083, 'Apicum-Açu', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210087, 'Araguanã', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210090, 'Araioses', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210095, 'Arame', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210100, 'Arari', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210110, 'Axixá', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210120, 'Bacabal', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210125, 'Bacabeira', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210130, 'Bacuri', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210135, 'Bacurituba', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210140, 'Balsas', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210150, 'Barão de Grajaú', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210160, 'Barra do Corda', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210170, 'Barreirinhas', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210173, 'Belágua', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210177, 'Bela Vista do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210180, 'Benedito Leite', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210190, 'Bequimão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210193, 'Bernardo do Mearim', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210197, 'Boa Vista do Gurupi', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210200, 'Bom Jardim', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210203, 'Bom Jesus das Selvas', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210207, 'Bom Lugar', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210210, 'Brejo', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210215, 'Brejo de Areia', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210220, 'Buriti', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210230, 'Buriti Bravo', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210232, 'Buriticupu', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210235, 'Buritirana', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210237, 'Cachoeira Grande', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210240, 'Cajapió', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210250, 'Cajari', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210255, 'Campestre do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210260, 'Cândido Mendes', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210270, 'Cantanhede', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210275, 'Capinzal do Norte', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210280, 'Carolina', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210290, 'Carutapera', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210300, 'Caxias', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210310, 'Cedral', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210312, 'Central do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210315, 'Centro do Guilherme', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210317, 'Centro Novo do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210320, 'Chapadinha', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210325, 'Cidelândia', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210330, 'Codó', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210340, 'Coelho Neto', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210350, 'Colinas', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210355, 'Conceição do Lago-Açu', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210360, 'Coroatá', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210370, 'Cururupu', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210375, 'Davinópolis', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210380, 'Dom Pedro', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210390, 'Duque Bacelar', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210400, 'Esperantinópolis', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210405, 'Estreito', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210407, 'Feira Nova do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210408, 'Fernando Falcão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210409, 'Formosa da Serra Negra', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210410, 'Fortaleza dos Nogueiras', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210420, 'Fortuna', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210430, 'Godofredo Viana', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210440, 'Gonçalves Dias', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210450, 'Governador Archer', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210455, 'Governador Edison Lobão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210460, 'Governador Eugênio Barros', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210462, 'Governador Luiz Rocha', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210465, 'Governador Newton Bello', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210467, 'Governador Nunes Freire', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210470, 'Graça Aranha', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210480, 'Grajaú', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210490, 'Guimarães', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210500, 'Humberto de Campos', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210510, 'Icatu', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210515, 'Igarapé do Meio', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210520, 'Igarapé Grande', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210530, 'Imperatriz', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210535, 'Itaipava do Grajaú', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210540, 'Itapecuru Mirim', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210542, 'Itinga do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210545, 'Jatobá', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210547, 'Jenipapo dos Vieiras', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210550, 'João Lisboa', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210560, 'Joselândia', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210565, 'Junco do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210570, 'Lago da Pedra', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210580, 'Lago do Junco', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210590, 'Lago Verde', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210592, 'Lagoa do Mato', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210594, 'Lago dos Rodrigues', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210596, 'Lagoa Grande do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210598, 'Lajeado Novo', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210600, 'Lima Campos', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210610, 'Loreto', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210620, 'Luís Domingues', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210630, 'Magalhães de Almeida', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210632, 'Maracaçumé', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210635, 'Marajá do Sena', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210637, 'Maranhãozinho', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210640, 'Mata Roma', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210650, 'Matinha', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210660, 'Matões', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210663, 'Matões do Norte', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210667, 'Milagres do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210670, 'Mirador', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210675, 'Miranda do Norte', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210680, 'Mirinzal', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210690, 'Monção', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210700, 'Montes Altos', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210710, 'Morros', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210720, 'Nina Rodrigues', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210725, 'Nova Colinas', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210730, 'Nova Iorque', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210735, 'Nova Olinda do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210740, 'Olho d''Água das Cunhãs', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210745, 'Olinda Nova do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210750, 'Paço do Lumiar', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210760, 'Palmeirândia', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210770, 'Paraibano', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210780, 'Parnarama', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210790, 'Passagem Franca', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210800, 'Pastos Bons', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210805, 'Paulino Neves', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210810, 'Paulo Ramos', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210820, 'Pedreiras', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210825, 'Pedro do Rosário', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210830, 'Penalva', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210840, 'Peri Mirim', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210845, 'Peritoró', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210850, 'Pindaré-Mirim', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210860, 'Pinheiro', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210870, 'Pio XII', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210880, 'Pirapemas', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210890, 'Poção de Pedras', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210900, 'Porto Franco', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210905, 'Porto Rico do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210910, 'Presidente Dutra', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210920, 'Presidente Juscelino', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210923, 'Presidente Médici', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210927, 'Presidente Sarney', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210930, 'Presidente Vargas', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210940, 'Primeira Cruz', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210945, 'Raposa', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210950, 'Riachão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210955, 'Ribamar Fiquene', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210960, 'Rosário', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210970, 'Sambaíba', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210975, 'Santa Filomena do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210980, 'Santa Helena', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (210990, 'Santa Inês', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211000, 'Santa Luzia', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211003, 'Santa Luzia do Paruá', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211010, 'Santa Quitéria do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211020, 'Santa Rita', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211023, 'Santana do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211027, 'Santo Amaro do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211030, 'Santo Antônio dos Lopes', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211040, 'São Benedito do Rio Preto', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211050, 'São Bento', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211060, 'São Bernardo', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211065, 'São Domingos do Azeitão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211070, 'São Domingos do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211080, 'São Félix de Balsas', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211085, 'São Francisco do Brejão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211090, 'São Francisco do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211100, 'São João Batista', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211102, 'São João do Carú', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211105, 'São João do Paraíso', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211107, 'São João do Soter', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211110, 'São João dos Patos', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211120, 'São José de Ribamar', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211125, 'São José dos Basílios', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211130, 'São Luís', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211140, 'São Luís Gonzaga do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211150, 'São Mateus do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211153, 'São Pedro da Água Branca', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211157, 'São Pedro dos Crentes', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211160, 'São Raimundo das Mangabeiras', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211163, 'São Raimundo do Doca Bezerra', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211167, 'São Roberto', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211170, 'São Vicente Ferrer', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211172, 'Satubinha', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211174, 'Senador Alexandre Costa', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211176, 'Senador La Rocque', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211178, 'Serrano do Maranhão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211180, 'Sítio Novo', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211190, 'Sucupira do Norte', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211195, 'Sucupira do Riachão', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211200, 'Tasso Fragoso', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211210, 'Timbiras', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211220, 'Timon', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211223, 'Trizidela do Vale', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211227, 'Tufilândia', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211230, 'Tuntum', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211240, 'Turiaçu', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211245, 'Turilândia', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211250, 'Tutóia', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211260, 'Urbano Santos', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211270, 'Vargem Grande', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211280, 'Viana', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211285, 'Vila Nova dos Martírios', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211290, 'Vitória do Mearim', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211300, 'Vitorino Freire', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (211400, 'Zé Doca', 21);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220005, 'Acauã', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220010, 'Agricolândia', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220020, 'Água Branca', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220025, 'Alagoinha do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220027, 'Alegrete do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220030, 'Alto Longá', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220040, 'Altos', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220045, 'Alvorada do Gurguéia', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220050, 'Amarante', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220060, 'Angical do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220070, 'Anísio de Abreu', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220080, 'Antônio Almeida', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220090, 'Aroazes', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220095, 'Aroeiras do Itaim', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220100, 'Arraial', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220105, 'Assunção do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220110, 'Avelino Lopes', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220115, 'Baixa Grande do Ribeiro', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220117, 'Barra D''Alcântara', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220120, 'Barras', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220130, 'Barreiras do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220140, 'Barro Duro', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220150, 'Batalha', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220155, 'Bela Vista do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220157, 'Belém do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220160, 'Beneditinos', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220170, 'Bertolínia', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220173, 'Betânia do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220177, 'Boa Hora', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220180, 'Bocaina', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220190, 'Bom Jesus', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220191, 'Bom Princípio do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220192, 'Bonfim do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220194, 'Boqueirão do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220196, 'Brasileira', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220198, 'Brejo do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220200, 'Buriti dos Lopes', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220202, 'Buriti dos Montes', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220205, 'Cabeceiras do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220207, 'Cajazeiras do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220208, 'Cajueiro da Praia', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220209, 'Caldeirão Grande do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220210, 'Campinas do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220211, 'Campo Alegre do Fidalgo', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220213, 'Campo Grande do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220217, 'Campo Largo do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220220, 'Campo Maior', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220225, 'Canavieira', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220230, 'Canto do Buriti', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220240, 'Capitão de Campos', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220245, 'Capitão Gervásio Oliveira', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220250, 'Caracol', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220253, 'Caraúbas do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220255, 'Caridade do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220260, 'Castelo do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220265, 'Caxingó', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220270, 'Cocal', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220271, 'Cocal de Telha', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220272, 'Cocal dos Alves', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220273, 'Coivaras', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220275, 'Colônia do Gurguéia', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220277, 'Colônia do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220280, 'Conceição do Canindé', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220285, 'Coronel José Dias', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220290, 'Corrente', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220300, 'Cristalândia do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220310, 'Cristino Castro', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220320, 'Curimatá', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220323, 'Currais', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220325, 'Curralinhos', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220327, 'Curral Novo do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220330, 'Demerval Lobão', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220335, 'Dirceu Arcoverde', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220340, 'Dom Expedito Lopes', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220342, 'Domingos Mourão', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220345, 'Dom Inocêncio', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220350, 'Elesbão Veloso', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220360, 'Eliseu Martins', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220370, 'Esperantina', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220375, 'Fartura do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220380, 'Flores do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220385, 'Floresta do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220390, 'Floriano', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220400, 'Francinópolis', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220410, 'Francisco Ayres', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220415, 'Francisco Macedo', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220420, 'Francisco Santos', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220430, 'Fronteiras', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220435, 'Geminiano', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220440, 'Gilbués', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220450, 'Guadalupe', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220455, 'Guaribas', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220460, 'Hugo Napoleão', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220465, 'Ilha Grande', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220470, 'Inhuma', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220480, 'Ipiranga do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220490, 'Isaías Coelho', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220500, 'Itainópolis', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220510, 'Itaueira', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220515, 'Jacobina do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220520, 'Jaicós', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220525, 'Jardim do Mulato', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220527, 'Jatobá do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220530, 'Jerumenha', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220535, 'João Costa', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220540, 'Joaquim Pires', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220545, 'Joca Marques', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220550, 'José de Freitas', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220551, 'Juazeiro do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220552, 'Júlio Borges', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220553, 'Jurema', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220554, 'Lagoinha do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220555, 'Lagoa Alegre', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220556, 'Lagoa do Barro do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220557, 'Lagoa de São Francisco', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220558, 'Lagoa do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220559, 'Lagoa do Sítio', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220560, 'Landri Sales', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220570, 'Luís Correia', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220580, 'Luzilândia', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220585, 'Madeiro', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220590, 'Manoel Emídio', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220595, 'Marcolândia', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220600, 'Marcos Parente', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220605, 'Massapê do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220610, 'Matias Olímpio', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220620, 'Miguel Alves', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220630, 'Miguel Leão', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220635, 'Milton Brandão', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220640, 'Monsenhor Gil', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220650, 'Monsenhor Hipólito', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220660, 'Monte Alegre do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220665, 'Morro Cabeça no Tempo', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220667, 'Morro do Chapéu do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220669, 'Murici dos Portelas', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220670, 'Nazaré do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220672, 'Nazária', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220675, 'Nossa Senhora de Nazaré', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220680, 'Nossa Senhora dos Remédios', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220690, 'Novo Oriente do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220695, 'Novo Santo Antônio', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220700, 'Oeiras', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220710, 'Olho D''Água do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220720, 'Padre Marcos', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220730, 'Paes Landim', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220735, 'Pajeú do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220740, 'Palmeira do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220750, 'Palmeirais', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220755, 'Paquetá', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220760, 'Parnaguá', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220770, 'Parnaíba', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220775, 'Passagem Franca do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220777, 'Patos do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220779, 'Pau D''Arco do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220780, 'Paulistana', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220785, 'Pavussu', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220790, 'Pedro II', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220793, 'Pedro Laurentino', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220795, 'Nova Santa Rita', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220800, 'Picos', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220810, 'Pimenteiras', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220820, 'Pio IX', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220830, 'Piracuruca', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220840, 'Piripiri', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220850, 'Porto', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220855, 'Porto Alegre do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220860, 'Prata do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220865, 'Queimada Nova', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220870, 'Redenção do Gurguéia', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220880, 'Regeneração', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220885, 'Riacho Frio', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220887, 'Ribeira do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220890, 'Ribeiro Gonçalves', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220900, 'Rio Grande do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220910, 'Santa Cruz do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220915, 'Santa Cruz dos Milagres', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220920, 'Santa Filomena', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220930, 'Santa Luz', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220935, 'Santana do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220937, 'Santa Rosa do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220940, 'Santo Antônio de Lisboa', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220945, 'Santo Antônio dos Milagres', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220950, 'Santo Inácio do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220955, 'São Braz do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220960, 'São Félix do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220965, 'São Francisco de Assis do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220970, 'São Francisco do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220975, 'São Gonçalo do Gurguéia', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220980, 'São Gonçalo do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220985, 'São João da Canabrava', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220987, 'São João da Fronteira', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220990, 'São João da Serra', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220995, 'São João da Varjota', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (220997, 'São João do Arraial', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221000, 'São João do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221005, 'São José do Divino', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221010, 'São José do Peixe', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221020, 'São José do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221030, 'São Julião', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221035, 'São Lourenço do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221037, 'São Luis do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221038, 'São Miguel da Baixa Grande', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221039, 'São Miguel do Fidalgo', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221040, 'São Miguel do Tapuio', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221050, 'São Pedro do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221060, 'São Raimundo Nonato', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221062, 'Sebastião Barros', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221063, 'Sebastião Leal', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221065, 'Sigefredo Pacheco', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221070, 'Simões', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221080, 'Simplício Mendes', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221090, 'Socorro do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221093, 'Sussuapara', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221095, 'Tamboril do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221097, 'Tanque do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221100, 'Teresina', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221110, 'União', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221120, 'Uruçuí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221130, 'Valença do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221135, 'Várzea Branca', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221140, 'Várzea Grande', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221150, 'Vera Mendes', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221160, 'Vila Nova do Piauí', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (221170, 'Wall Ferraz', 22);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230010, 'Abaiara', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230015, 'Acarape', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230020, 'Acaraú', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230030, 'Acopiara', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230040, 'Aiuaba', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230050, 'Alcântaras', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230060, 'Altaneira', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230070, 'Alto Santo', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230075, 'Amontada', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230080, 'Antonina do Norte', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230090, 'Apuiarés', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230100, 'Aquiraz', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230110, 'Aracati', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230120, 'Aracoiaba', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230125, 'Ararendá', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230130, 'Araripe', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230140, 'Aratuba', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230150, 'Arneiroz', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230160, 'Assaré', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230170, 'Aurora', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230180, 'Baixio', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230185, 'Banabuiú', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230190, 'Barbalha', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230195, 'Barreira', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230200, 'Barro', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230205, 'Barroquinha', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230210, 'Baturité', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230220, 'Beberibe', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230230, 'Bela Cruz', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230240, 'Boa Viagem', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230250, 'Brejo Santo', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230260, 'Camocim', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230270, 'Campos Sales', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230280, 'Canindé', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230290, 'Capistrano', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230300, 'Caridade', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230310, 'Cariré', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230320, 'Caririaçu', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230330, 'Cariús', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230340, 'Carnaubal', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230350, 'Cascavel', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230360, 'Catarina', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230365, 'Catunda', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230370, 'Caucaia', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230380, 'Cedro', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230390, 'Chaval', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230393, 'Choró', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230395, 'Chorozinho', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230400, 'Coreaú', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230410, 'Crateús', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230420, 'Crato', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230423, 'Croatá', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230425, 'Cruz', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230426, 'Deputado Irapuan Pinheiro', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230427, 'Ererê', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230428, 'Eusébio', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230430, 'Farias Brito', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230435, 'Forquilha', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230440, 'Fortaleza', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230445, 'Fortim', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230450, 'Frecheirinha', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230460, 'General Sampaio', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230465, 'Graça', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230470, 'Granja', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230480, 'Granjeiro', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230490, 'Groaíras', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230495, 'Guaiúba', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230500, 'Guaraciaba do Norte', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230510, 'Guaramiranga', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230520, 'Hidrolândia', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230523, 'Horizonte', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230526, 'Ibaretama', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230530, 'Ibiapina', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230533, 'Ibicuitinga', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230535, 'Icapuí', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230540, 'Icó', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230550, 'Iguatu', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230560, 'Independência', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230565, 'Ipaporanga', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230570, 'Ipaumirim', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230580, 'Ipu', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230590, 'Ipueiras', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230600, 'Iracema', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230610, 'Irauçuba', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230620, 'Itaiçaba', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230625, 'Itaitinga', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230630, 'Itapagé', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230640, 'Itapipoca', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230650, 'Itapiúna', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230655, 'Itarema', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230660, 'Itatira', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230670, 'Jaguaretama', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230680, 'Jaguaribara', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230690, 'Jaguaribe', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230700, 'Jaguaruana', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230710, 'Jardim', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230720, 'Jati', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230725, 'Jijoca de Jericoacoara', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230730, 'Juazeiro do Norte', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230740, 'Jucás', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230750, 'Lavras da Mangabeira', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230760, 'Limoeiro do Norte', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230763, 'Madalena', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230765, 'Maracanaú', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230770, 'Maranguape', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230780, 'Marco', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230790, 'Martinópole', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230800, 'Massapê', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230810, 'Mauriti', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230820, 'Meruoca', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230830, 'Milagres', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230835, 'Milhã', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230837, 'Miraíma', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230840, 'Missão Velha', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230850, 'Mombaça', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230860, 'Monsenhor Tabosa', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230870, 'Morada Nova', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230880, 'Moraújo', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230890, 'Morrinhos', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230900, 'Mucambo', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230910, 'Mulungu', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230920, 'Nova Olinda', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230930, 'Nova Russas', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230940, 'Novo Oriente', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230945, 'Ocara', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230950, 'Orós', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230960, 'Pacajus', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230970, 'Pacatuba', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230980, 'Pacoti', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (230990, 'Pacujá', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231000, 'Palhano', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231010, 'Palmácia', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231020, 'Paracuru', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231025, 'Paraipaba', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231030, 'Parambu', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231040, 'Paramoti', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231050, 'Pedra Branca', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231060, 'Penaforte', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231070, 'Pentecoste', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231080, 'Pereiro', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231085, 'Pindoretama', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231090, 'Piquet Carneiro', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231095, 'Pires Ferreira', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231100, 'Poranga', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231110, 'Porteiras', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231120, 'Potengi', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231123, 'Potiretama', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231126, 'Quiterianópolis', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231130, 'Quixadá', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231135, 'Quixelô', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231140, 'Quixeramobim', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231150, 'Quixeré', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231160, 'Redenção', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231170, 'Reriutaba', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231180, 'Russas', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231190, 'Saboeiro', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231195, 'Salitre', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231200, 'Santana do Acaraú', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231210, 'Santana do Cariri', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231220, 'Santa Quitéria', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231230, 'São Benedito', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231240, 'São Gonçalo do Amarante', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231250, 'São João do Jaguaribe', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231260, 'São Luís do Curu', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231270, 'Senador Pompeu', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231280, 'Senador Sá', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231290, 'Sobral', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231300, 'Solonópole', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231310, 'Tabuleiro do Norte', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231320, 'Tamboril', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231325, 'Tarrafas', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231330, 'Tauá', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231335, 'Tejuçuoca', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231340, 'Tianguá', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231350, 'Trairi', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231355, 'Tururu', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231360, 'Ubajara', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231370, 'Umari', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231375, 'Umirim', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231380, 'Uruburetama', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231390, 'Uruoca', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231395, 'Varjota', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231400, 'Várzea Alegre', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (231410, 'Viçosa do Ceará', 23);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240010, 'Acari', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240020, 'Açu', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240030, 'Afonso Bezerra', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240040, 'Água Nova', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240050, 'Alexandria', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240060, 'Almino Afonso', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240070, 'Alto do Rodrigues', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240080, 'Angicos', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240090, 'Antônio Martins', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240100, 'Apodi', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240110, 'Areia Branca', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240120, 'Arês', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240130, 'Augusto Severo', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240140, 'Baía Formosa', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240145, 'Baraúna', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240150, 'Barcelona', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240160, 'Bento Fernandes', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240165, 'Bodó', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240170, 'Bom Jesus', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240180, 'Brejinho', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240185, 'Caiçara do Norte', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240190, 'Caiçara do Rio do Vento', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240200, 'Caicó', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240210, 'Campo Redondo', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240220, 'Canguaretama', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240230, 'Caraúbas', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240240, 'Carnaúba dos Dantas', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240250, 'Carnaubais', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240260, 'Ceará-Mirim', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240270, 'Cerro Corá', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240280, 'Coronel Ezequiel', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240290, 'Coronel João Pessoa', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240300, 'Cruzeta', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240310, 'Currais Novos', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240320, 'Doutor Severiano', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240325, 'Parnamirim', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240330, 'Encanto', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240340, 'Equador', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240350, 'Espírito Santo', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240360, 'Extremoz', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240370, 'Felipe Guerra', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240375, 'Fernando Pedroza', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240380, 'Florânia', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240390, 'Francisco Dantas', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240400, 'Frutuoso Gomes', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240410, 'Galinhos', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240420, 'Goianinha', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240430, 'Governador Dix-Sept Rosado', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240440, 'Grossos', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240450, 'Guamaré', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240460, 'Ielmo Marinho', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240470, 'Ipanguaçu', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240480, 'Ipueira', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240485, 'Itajá', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240490, 'Itaú', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240500, 'Jaçanã', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240510, 'Jandaíra', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240520, 'Janduís', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240530, 'Januário Cicco', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240540, 'Japi', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240550, 'Jardim de Angicos', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240560, 'Jardim de Piranhas', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240570, 'Jardim do Seridó', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240580, 'João Câmara', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240590, 'João Dias', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240600, 'José da Penha', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240610, 'Jucurutu', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240615, 'Jundiá', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240620, 'Lagoa d''Anta', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240630, 'Lagoa de Pedras', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240640, 'Lagoa de Velhos', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240650, 'Lagoa Nova', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240660, 'Lagoa Salgada', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240670, 'Lajes', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240680, 'Lajes Pintadas', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240690, 'Lucrécia', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240700, 'Luís Gomes', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240710, 'Macaíba', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240720, 'Macau', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240725, 'Major Sales', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240730, 'Marcelino Vieira', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240740, 'Martins', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240750, 'Maxaranguape', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240760, 'Messias Targino', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240770, 'Montanhas', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240780, 'Monte Alegre', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240790, 'Monte das Gameleiras', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240800, 'Mossoró', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240810, 'Natal', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240820, 'Nísia Floresta', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240830, 'Nova Cruz', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240840, 'Olho-d''Água do Borges', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240850, 'Ouro Branco', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240860, 'Paraná', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240870, 'Paraú', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240880, 'Parazinho', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240890, 'Parelhas', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240895, 'Rio do Fogo', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240910, 'Passa e Fica', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240920, 'Passagem', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240930, 'Patu', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240933, 'Santa Maria', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240940, 'Pau dos Ferros', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240950, 'Pedra Grande', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240960, 'Pedra Preta', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240970, 'Pedro Avelino', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240980, 'Pedro Velho', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (240990, 'Pendências', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241000, 'Pilões', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241010, 'Poço Branco', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241020, 'Portalegre', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241025, 'Porto do Mangue', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241030, 'Presidente Juscelino', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241040, 'Pureza', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241050, 'Rafael Fernandes', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241060, 'Rafael Godeiro', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241070, 'Riacho da Cruz', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241080, 'Riacho de Santana', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241090, 'Riachuelo', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241100, 'Rodolfo Fernandes', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241105, 'Tibau', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241110, 'Ruy Barbosa', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241120, 'Santa Cruz', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241140, 'Santana do Matos', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241142, 'Santana do Seridó', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241150, 'Santo Antônio', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241160, 'São Bento do Norte', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241170, 'São Bento do Trairí', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241180, 'São Fernando', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241190, 'São Francisco do Oeste', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241200, 'São Gonçalo do Amarante', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241210, 'São João do Sabugi', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241220, 'São José de Mipibu', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241230, 'São José do Campestre', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241240, 'São José do Seridó', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241250, 'São Miguel', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241255, 'São Miguel do Gostoso', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241260, 'São Paulo do Potengi', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241270, 'São Pedro', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241280, 'São Rafael', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241290, 'São Tomé', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241300, 'São Vicente', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241310, 'Senador Elói de Souza', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241320, 'Senador Georgino Avelino', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241330, 'Serra de São Bento', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241335, 'Serra do Mel', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241340, 'Serra Negra do Norte', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241350, 'Serrinha', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241355, 'Serrinha dos Pintos', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241360, 'Severiano Melo', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241370, 'Sítio Novo', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241380, 'Taboleiro Grande', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241390, 'Taipu', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241400, 'Tangará', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241410, 'Tenente Ananias', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241415, 'Tenente Laurentino Cruz', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241420, 'Tibau do Sul', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241430, 'Timbaúba dos Batistas', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241440, 'Touros', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241445, 'Triunfo Potiguar', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241450, 'Umarizal', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241460, 'Upanema', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241470, 'Várzea', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241475, 'Venha-Ver', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241480, 'Vera Cruz', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241490, 'Viçosa', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (241500, 'Vila Flor', 24);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250010, 'Água Branca', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250020, 'Aguiar', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250030, 'Alagoa Grande', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250040, 'Alagoa Nova', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250050, 'Alagoinha', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250053, 'Alcantil', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250057, 'Algodão de Jandaíra', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250060, 'Alhandra', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250070, 'São João do Rio do Peixe', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250073, 'Amparo', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250077, 'Aparecida', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250080, 'Araçagi', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250090, 'Arara', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250100, 'Araruna', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250110, 'Areia', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250115, 'Areia de Baraúnas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250120, 'Areial', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250130, 'Aroeiras', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250135, 'Assunção', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250140, 'Baía da Traição', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250150, 'Bananeiras', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250153, 'Baraúna', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250157, 'Barra de Santana', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250160, 'Barra de Santa Rosa', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250170, 'Barra de São Miguel', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250180, 'Bayeux', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250190, 'Belém', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250200, 'Belém do Brejo do Cruz', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250205, 'Bernardino Batista', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250210, 'Boa Ventura', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250215, 'Boa Vista', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250220, 'Bom Jesus', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250230, 'Bom Sucesso', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250240, 'Bonito de Santa Fé', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250250, 'Boqueirão', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250260, 'Igaracy', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250270, 'Borborema', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250280, 'Brejo do Cruz', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250290, 'Brejo dos Santos', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250300, 'Caaporã', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250310, 'Cabaceiras', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250320, 'Cabedelo', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250330, 'Cachoeira dos Índios', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250340, 'Cacimba de Areia', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250350, 'Cacimba de Dentro', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250355, 'Cacimbas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250360, 'Caiçara', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250370, 'Cajazeiras', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250375, 'Cajazeirinhas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250380, 'Caldas Brandão', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250390, 'Camalaú', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250400, 'Campina Grande', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250403, 'Capim', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250407, 'Caraúbas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250410, 'Carrapateira', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250415, 'Casserengue', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250420, 'Catingueira', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250430, 'Catolé do Rocha', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250435, 'Caturité', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250440, 'Conceição', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250450, 'Condado', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250460, 'Conde', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250470, 'Congo', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250480, 'Coremas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250485, 'Coxixola', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250490, 'Cruz do Espírito Santo', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250500, 'Cubati', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250510, 'Cuité', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250520, 'Cuitegi', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250523, 'Cuité de Mamanguape', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250527, 'Curral de Cima', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250530, 'Curral Velho', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250535, 'Damião', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250540, 'Desterro', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250550, 'Vista Serrana', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250560, 'Diamante', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250570, 'Dona Inês', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250580, 'Duas Estradas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250590, 'Emas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250600, 'Esperança', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250610, 'Fagundes', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250620, 'Frei Martinho', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250625, 'Gado Bravo', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250630, 'Guarabira', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250640, 'Gurinhém', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250650, 'Gurjão', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250660, 'Ibiara', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250670, 'Imaculada', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250680, 'Ingá', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250690, 'Itabaiana', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250700, 'Itaporanga', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250710, 'Itapororoca', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250720, 'Itatuba', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250730, 'Jacaraú', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250740, 'Jericó', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250750, 'João Pessoa', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250760, 'Juarez Távora', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250770, 'Juazeirinho', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250780, 'Junco do Seridó', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250790, 'Juripiranga', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250800, 'Juru', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250810, 'Lagoa', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250820, 'Lagoa de Dentro', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250830, 'Lagoa Seca', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250840, 'Lastro', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250850, 'Livramento', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250855, 'Logradouro', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250860, 'Lucena', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250870, 'Mãe d''Água', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250880, 'Malta', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250890, 'Mamanguape', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250900, 'Manaíra', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250905, 'Marcação', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250910, 'Mari', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250915, 'Marizópolis', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250920, 'Massaranduba', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250930, 'Mataraca', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250933, 'Matinhas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250937, 'Mato Grosso', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250939, 'Maturéia', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250940, 'Mogeiro', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250950, 'Montadas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250960, 'Monte Horebe', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250970, 'Monteiro', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250980, 'Mulungu', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (250990, 'Natuba', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251000, 'Nazarezinho', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251010, 'Nova Floresta', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251020, 'Nova Olinda', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251030, 'Nova Palmeira', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251040, 'Olho d''Água', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251050, 'Olivedos', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251060, 'Ouro Velho', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251065, 'Parari', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251070, 'Passagem', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251080, 'Patos', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251090, 'Paulista', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251100, 'Pedra Branca', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251110, 'Pedra Lavrada', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251120, 'Pedras de Fogo', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251130, 'Piancó', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251140, 'Picuí', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251150, 'Pilar', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251160, 'Pilões', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251170, 'Pilõezinhos', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251180, 'Pirpirituba', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251190, 'Pitimbu', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251200, 'Pocinhos', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251203, 'Poço Dantas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251207, 'Poço de José de Moura', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251210, 'Pombal', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251220, 'Prata', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251230, 'Princesa Isabel', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251240, 'Puxinanã', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251250, 'Queimadas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251260, 'Quixabá', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251270, 'Remígio', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251272, 'Pedro Régis', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251274, 'Riachão', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251275, 'Riachão do Bacamarte', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251276, 'Riachão do Poço', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251278, 'Riacho de Santo Antônio', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251280, 'Riacho dos Cavalos', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251290, 'Rio Tinto', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251300, 'Salgadinho', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251310, 'Salgado de São Félix', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251315, 'Santa Cecília', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251320, 'Santa Cruz', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251330, 'Santa Helena', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251335, 'Santa Inês', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251340, 'Santa Luzia', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251350, 'Santana de Mangueira', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251360, 'Santana dos Garrotes', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251365, 'Santarém', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251370, 'Santa Rita', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251380, 'Santa Teresinha', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251385, 'Santo André', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251390, 'São Bento', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251392, 'São Bentinho', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251394, 'São Domingos do Cariri', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251396, 'São Domingos', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251398, 'São Francisco', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251400, 'São João do Cariri', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251410, 'São João do Tigre', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251420, 'São José da Lagoa Tapada', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251430, 'São José de Caiana', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251440, 'São José de Espinharas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251445, 'São José dos Ramos', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251450, 'São José de Piranhas', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251455, 'São José de Princesa', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251460, 'São José do Bonfim', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251465, 'São José do Brejo do Cruz', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251470, 'São José do Sabugi', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251480, 'São José dos Cordeiros', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251490, 'São Mamede', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251500, 'São Miguel de Taipu', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251510, 'São Sebastião de Lagoa de Roça', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251520, 'São Sebastião do Umbuzeiro', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251530, 'Sapé', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251540, 'Seridó', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251550, 'Serra Branca', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251560, 'Serra da Raiz', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251570, 'Serra Grande', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251580, 'Serra Redonda', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251590, 'Serraria', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251593, 'Sertãozinho', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251597, 'Sobrado', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251600, 'Solânea', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251610, 'Soledade', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251615, 'Sossêgo', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251620, 'Sousa', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251630, 'Sumé', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251640, 'Campo de Santana', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251650, 'Taperoá', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251660, 'Tavares', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251670, 'Teixeira', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251675, 'Tenório', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251680, 'Triunfo', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251690, 'Uiraúna', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251700, 'Umbuzeiro', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251710, 'Várzea', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251720, 'Vieirópolis', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (251740, 'Zabelê', 25);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260005, 'Abreu e Lima', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260010, 'Afogados da Ingazeira', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260020, 'Afrânio', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260030, 'Agrestina', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260040, 'Água Preta', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260050, 'Águas Belas', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260060, 'Alagoinha', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260070, 'Aliança', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260080, 'Altinho', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260090, 'Amaraji', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260100, 'Angelim', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260105, 'Araçoiaba', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260110, 'Araripina', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260120, 'Arcoverde', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260130, 'Barra de Guabiraba', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260140, 'Barreiros', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260150, 'Belém de Maria', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260160, 'Belém de São Francisco', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260170, 'Belo Jardim', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260180, 'Betânia', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260190, 'Bezerros', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260200, 'Bodocó', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260210, 'Bom Conselho', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260220, 'Bom Jardim', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260230, 'Bonito', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260240, 'Brejão', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260250, 'Brejinho', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260260, 'Brejo da Madre de Deus', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260270, 'Buenos Aires', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260280, 'Buíque', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260290, 'Cabo de Santo Agostinho', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260300, 'Cabrobó', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260310, 'Cachoeirinha', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260320, 'Caetés', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260330, 'Calçado', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260340, 'Calumbi', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260345, 'Camaragibe', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260350, 'Camocim de São Félix', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260360, 'Camutanga', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260370, 'Canhotinho', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260380, 'Capoeiras', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260390, 'Carnaíba', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260392, 'Carnaubeira da Penha', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260400, 'Carpina', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260410, 'Caruaru', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260415, 'Casinhas', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260420, 'Catende', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260430, 'Cedro', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260440, 'Chã de Alegria', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260450, 'Chã Grande', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260460, 'Condado', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260470, 'Correntes', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260480, 'Cortês', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260490, 'Cumaru', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260500, 'Cupira', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260510, 'Custódia', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260515, 'Dormentes', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260520, 'Escada', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260530, 'Exu', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260540, 'Feira Nova', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260545, 'Fernando de Noronha', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260550, 'Ferreiros', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260560, 'Flores', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260570, 'Floresta', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260580, 'Frei Miguelinho', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260590, 'Gameleira', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260600, 'Garanhuns', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260610, 'Glória do Goitá', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260620, 'Goiana', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260630, 'Granito', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260640, 'Gravatá', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260650, 'Iati', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260660, 'Ibimirim', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260670, 'Ibirajuba', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260680, 'Igarassu', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260690, 'Iguaraci', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260700, 'Inajá', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260710, 'Ingazeira', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260720, 'Ipojuca', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260730, 'Ipubi', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260740, 'Itacuruba', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260750, 'Itaíba', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260760, 'Ilha de Itamaracá', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260765, 'Itambé', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260770, 'Itapetim', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260775, 'Itapissuma', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260780, 'Itaquitinga', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260790, 'Jaboatão dos Guararapes', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260795, 'Jaqueira', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260800, 'Jataúba', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260805, 'Jatobá', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260810, 'João Alfredo', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260820, 'Joaquim Nabuco', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260825, 'Jucati', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260830, 'Jupi', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260840, 'Jurema', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260845, 'Lagoa do Carro', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260850, 'Lagoa do Itaenga', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260860, 'Lagoa do Ouro', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260870, 'Lagoa dos Gatos', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260875, 'Lagoa Grande', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260880, 'Lajedo', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260890, 'Limoeiro', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260900, 'Macaparana', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260910, 'Machados', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260915, 'Manari', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260920, 'Maraial', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260930, 'Mirandiba', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260940, 'Moreno', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260950, 'Nazaré da Mata', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260960, 'Olinda', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260970, 'Orobó', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260980, 'Orocó', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (260990, 'Ouricuri', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261000, 'Palmares', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261010, 'Palmeirina', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261020, 'Panelas', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261030, 'Paranatama', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261040, 'Parnamirim', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261050, 'Passira', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261060, 'Paudalho', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261070, 'Paulista', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261080, 'Pedra', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261090, 'Pesqueira', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261100, 'Petrolândia', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261110, 'Petrolina', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261120, 'Poção', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261130, 'Pombos', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261140, 'Primavera', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261150, 'Quipapá', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261153, 'Quixaba', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261160, 'Recife', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261170, 'Riacho das Almas', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261180, 'Ribeirão', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261190, 'Rio Formoso', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261200, 'Sairé', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261210, 'Salgadinho', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261220, 'Salgueiro', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261230, 'Saloá', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261240, 'Sanharó', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261245, 'Santa Cruz', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261247, 'Santa Cruz da Baixa Verde', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261250, 'Santa Cruz do Capibaribe', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261255, 'Santa Filomena', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261260, 'Santa Maria da Boa Vista', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261270, 'Santa Maria do Cambucá', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261280, 'Santa Terezinha', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261290, 'São Benedito do Sul', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261300, 'São Bento do Una', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261310, 'São Caitano', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261320, 'São João', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261330, 'São Joaquim do Monte', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261340, 'São José da Coroa Grande', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261350, 'São José do Belmonte', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261360, 'São José do Egito', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261370, 'São Lourenço da Mata', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261380, 'São Vicente Ferrer', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261390, 'Serra Talhada', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261400, 'Serrita', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261410, 'Sertânia', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261420, 'Sirinhaém', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261430, 'Moreilândia', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261440, 'Solidão', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261450, 'Surubim', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261460, 'Tabira', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261470, 'Tacaimbó', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261480, 'Tacaratu', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261485, 'Tamandaré', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261500, 'Taquaritinga do Norte', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261510, 'Terezinha', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261520, 'Terra Nova', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261530, 'Timbaúba', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261540, 'Toritama', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261550, 'Tracunhaém', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261560, 'Trindade', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261570, 'Triunfo', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261580, 'Tupanatinga', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261590, 'Tuparetama', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261600, 'Venturosa', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261610, 'Verdejante', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261618, 'Vertente do Lério', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261620, 'Vertentes', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261630, 'Vicência', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261640, 'Vitória de Santo Antão', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (261650, 'Xexéu', 26);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270010, 'Água Branca', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270020, 'Anadia', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270030, 'Arapiraca', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270040, 'Atalaia', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270050, 'Barra de Santo Antônio', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270060, 'Barra de São Miguel', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270070, 'Batalha', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270080, 'Belém', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270090, 'Belo Monte', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270100, 'Boca da Mata', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270110, 'Branquinha', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270120, 'Cacimbinhas', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270130, 'Cajueiro', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270135, 'Campestre', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270140, 'Campo Alegre', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270150, 'Campo Grande', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270160, 'Canapi', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270170, 'Capela', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270180, 'Carneiros', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270190, 'Chã Preta', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270200, 'Coité do Nóia', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270210, 'Colônia Leopoldina', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270220, 'Coqueiro Seco', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270230, 'Coruripe', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270235, 'Craíbas', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270240, 'Delmiro Gouveia', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270250, 'Dois Riachos', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270255, 'Estrela de Alagoas', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270260, 'Feira Grande', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270270, 'Feliz Deserto', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270280, 'Flexeiras', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270290, 'Girau do Ponciano', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270300, 'Ibateguara', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270310, 'Igaci', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270320, 'Igreja Nova', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270330, 'Inhapi', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270340, 'Jacaré dos Homens', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270350, 'Jacuípe', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270360, 'Japaratinga', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270370, 'Jaramataia', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270375, 'Jequiá da Praia', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270380, 'Joaquim Gomes', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270390, 'Jundiá', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270400, 'Junqueiro', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270410, 'Lagoa da Canoa', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270420, 'Limoeiro de Anadia', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270430, 'Maceió', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270440, 'Major Isidoro', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270450, 'Maragogi', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270460, 'Maravilha', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270470, 'Marechal Deodoro', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270480, 'Maribondo', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270490, 'Mar Vermelho', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270500, 'Mata Grande', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270510, 'Matriz de Camaragibe', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270520, 'Messias', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270530, 'Minador do Negrão', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270540, 'Monteirópolis', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270550, 'Murici', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270560, 'Novo Lino', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270570, 'Olho d''Água das Flores', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270580, 'Olho d''Água do Casado', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270590, 'Olho d''Água Grande', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270600, 'Olivença', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270610, 'Ouro Branco', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270620, 'Palestina', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270630, 'Palmeira dos Índios', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270640, 'Pão de Açúcar', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270642, 'Pariconha', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270644, 'Paripueira', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270650, 'Passo de Camaragibe', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270660, 'Paulo Jacinto', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270670, 'Penedo', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270680, 'Piaçabuçu', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270690, 'Pilar', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270700, 'Pindoba', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270710, 'Piranhas', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270720, 'Poço das Trincheiras', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270730, 'Porto Calvo', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270740, 'Porto de Pedras', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270750, 'Porto Real do Colégio', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270760, 'Quebrangulo', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270770, 'Rio Largo', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270780, 'Roteiro', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270790, 'Santa Luzia do Norte', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270800, 'Santana do Ipanema', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270810, 'Santana do Mundaú', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270820, 'São Brás', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270830, 'São José da Laje', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270840, 'São José da Tapera', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270850, 'São Luís do Quitunde', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270860, 'São Miguel dos Campos', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270870, 'São Miguel dos Milagres', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270880, 'São Sebastião', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270890, 'Satuba', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270895, 'Senador Rui Palmeira', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270900, 'Tanque d''Arca', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270910, 'Taquarana', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270915, 'Teotônio Vilela', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270920, 'Traipu', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270930, 'União dos Palmares', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (270940, 'Viçosa', 27);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280010, 'Amparo de São Francisco', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280020, 'Aquidabã', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280030, 'Aracaju', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280040, 'Arauá', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280050, 'Areia Branca', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280060, 'Barra dos Coqueiros', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280067, 'Boquim', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280070, 'Brejo Grande', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280100, 'Campo do Brito', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280110, 'Canhoba', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280120, 'Canindé de São Francisco', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280130, 'Capela', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280140, 'Carira', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280150, 'Carmópolis', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280160, 'Cedro de São João', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280170, 'Cristinápolis', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280190, 'Cumbe', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280200, 'Divina Pastora', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280210, 'Estância', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280220, 'Feira Nova', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280230, 'Frei Paulo', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280240, 'Gararu', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280250, 'General Maynard', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280260, 'Gracho Cardoso', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280270, 'Ilha das Flores', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280280, 'Indiaroba', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280290, 'Itabaiana', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280300, 'Itabaianinha', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280310, 'Itabi', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280320, 'Itaporanga d''Ajuda', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280330, 'Japaratuba', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280340, 'Japoatã', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280350, 'Lagarto', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280360, 'Laranjeiras', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280370, 'Macambira', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280380, 'Malhada dos Bois', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280390, 'Malhador', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280400, 'Maruim', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280410, 'Moita Bonita', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280420, 'Monte Alegre de Sergipe', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280430, 'Muribeca', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280440, 'Neópolis', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280445, 'Nossa Senhora Aparecida', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280450, 'Nossa Senhora da Glória', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280460, 'Nossa Senhora das Dores', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280470, 'Nossa Senhora de Lourdes', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280480, 'Nossa Senhora do Socorro', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280490, 'Pacatuba', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280500, 'Pedra Mole', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280510, 'Pedrinhas', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280520, 'Pinhão', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280530, 'Pirambu', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280540, 'Poço Redondo', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280550, 'Poço Verde', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280560, 'Porto da Folha', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280570, 'Propriá', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280580, 'Riachão do Dantas', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280590, 'Riachuelo', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280600, 'Ribeirópolis', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280610, 'Rosário do Catete', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280620, 'Salgado', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280630, 'Santa Luzia do Itanhy', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280640, 'Santana do São Francisco', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280650, 'Santa Rosa de Lima', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280660, 'Santo Amaro das Brotas', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280670, 'São Cristóvão', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280680, 'São Domingos', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280690, 'São Francisco', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280700, 'São Miguel do Aleixo', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280710, 'Simão Dias', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280720, 'Siriri', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280730, 'Telha', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280740, 'Tobias Barreto', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280750, 'Tomar do Geru', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (280760, 'Umbaúba', 28);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290010, 'Abaíra', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290020, 'Abaré', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290030, 'Acajutiba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290035, 'Adustina', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290040, 'Água Fria', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290050, 'Érico Cardoso', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290060, 'Aiquara', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290070, 'Alagoinhas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290080, 'Alcobaça', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290090, 'Almadina', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290100, 'Amargosa', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290110, 'Amélia Rodrigues', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290115, 'América Dourada', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290120, 'Anagé', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290130, 'Andaraí', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290135, 'Andorinha', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290140, 'Angical', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290150, 'Anguera', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290160, 'Antas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290170, 'Antônio Cardoso', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290180, 'Antônio Gonçalves', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290190, 'Aporá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290195, 'Apuarema', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290200, 'Aracatu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290205, 'Araças', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290210, 'Araci', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290220, 'Aramari', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290225, 'Arataca', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290230, 'Aratuípe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290240, 'Aurelino Leal', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290250, 'Baianópolis', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290260, 'Baixa Grande', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290265, 'Banzaê', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290270, 'Barra', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290280, 'Barra da Estiva', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290290, 'Barra do Choça', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290300, 'Barra do Mendes', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290310, 'Barra do Rocha', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290320, 'Barreiras', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290323, 'Barro Alto', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290327, 'Barrocas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290330, 'Barro Preto', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290340, 'Belmonte', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290350, 'Belo Campo', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290360, 'Biritinga', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290370, 'Boa Nova', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290380, 'Boa Vista do Tupim', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290390, 'Bom Jesus da Lapa', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290395, 'Bom Jesus da Serra', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290400, 'Boninal', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290405, 'Bonito', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290410, 'Boquira', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290420, 'Botuporã', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290430, 'Brejões', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290440, 'Brejolândia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290450, 'Brotas de Macaúbas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290460, 'Brumado', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290470, 'Buerarema', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290475, 'Buritirama', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290480, 'Caatiba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290485, 'Cabaceiras do Paraguaçu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290490, 'Cachoeira', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290500, 'Caculé', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290510, 'Caém', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290515, 'Caetanos', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290520, 'Caetité', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290530, 'Cafarnaum', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290540, 'Cairu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290550, 'Caldeirão Grande', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290560, 'Camacan', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290570, 'Camaçari', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290580, 'Camamu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290590, 'Campo Alegre de Lourdes', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290600, 'Campo Formoso', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290610, 'Canápolis', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290620, 'Canarana', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290630, 'Canavieiras', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290640, 'Candeal', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290650, 'Candeias', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290660, 'Candiba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290670, 'Cândido Sales', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290680, 'Cansanção', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290682, 'Canudos', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290685, 'Capela do Alto Alegre', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290687, 'Capim Grosso', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290689, 'Caraíbas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290690, 'Caravelas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290700, 'Cardeal da Silva', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290710, 'Carinhanha', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290720, 'Casa Nova', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290730, 'Castro Alves', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290740, 'Catolândia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290750, 'Catu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290755, 'Caturama', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290760, 'Central', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290770, 'Chorrochó', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290780, 'Cícero Dantas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290790, 'Cipó', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290800, 'Coaraci', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290810, 'Cocos', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290820, 'Conceição da Feira', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290830, 'Conceição do Almeida', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290840, 'Conceição do Coité', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290850, 'Conceição do Jacuípe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290860, 'Conde', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290870, 'Condeúba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290880, 'Contendas do Sincorá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290890, 'Coração de Maria', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290900, 'Cordeiros', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290910, 'Coribe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290920, 'Coronel João Sá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290930, 'Correntina', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290940, 'Cotegipe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290950, 'Cravolândia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290960, 'Crisópolis', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290970, 'Cristópolis', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290980, 'Cruz das Almas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (290990, 'Curaçá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291000, 'Dário Meira', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291005, 'Dias D''Ávila', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291010, 'Dom Basílio', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291020, 'Dom Macedo Costa', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291030, 'Elísio Medrado', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291040, 'Encruzilhada', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291050, 'Entre Rios', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291060, 'Esplanada', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291070, 'Euclides da Cunha', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291072, 'Eunápolis', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291075, 'Fátima', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291077, 'Feira da Mata', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291080, 'Feira de Santana', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291085, 'Filadélfia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291090, 'Firmino Alves', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291100, 'Floresta Azul', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291110, 'Formosa do Rio Preto', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291120, 'Gandu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291125, 'Gavião', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291130, 'Gentio do Ouro', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291140, 'Glória', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291150, 'Gongogi', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291160, 'Governador Mangabeira', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291165, 'Guajeru', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291170, 'Guanambi', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291180, 'Guaratinga', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291185, 'Heliópolis', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291190, 'Iaçu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291200, 'Ibiassucê', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291210, 'Ibicaraí', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291220, 'Ibicoara', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291230, 'Ibicuí', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291240, 'Ibipeba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291250, 'Ibipitanga', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291260, 'Ibiquera', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291270, 'Ibirapitanga', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291280, 'Ibirapuã', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291290, 'Ibirataia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291300, 'Ibitiara', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291310, 'Ibititá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291320, 'Ibotirama', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291330, 'Ichu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291340, 'Igaporã', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291345, 'Igrapiúna', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291350, 'Iguaí', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291360, 'Ilhéus', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291370, 'Inhambupe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291380, 'Ipecaetá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291390, 'Ipiaú', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291400, 'Ipirá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291410, 'Ipupiara', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291420, 'Irajuba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291430, 'Iramaia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291440, 'Iraquara', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291450, 'Irará', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291460, 'Irecê', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291465, 'Itabela', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291470, 'Itaberaba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291480, 'Itabuna', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291490, 'Itacaré', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291500, 'Itaeté', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291510, 'Itagi', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291520, 'Itagibá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291530, 'Itagimirim', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291535, 'Itaguaçu da Bahia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291540, 'Itaju do Colônia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291550, 'Itajuípe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291560, 'Itamaraju', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291570, 'Itamari', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291580, 'Itambé', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291590, 'Itanagra', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291600, 'Itanhém', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291610, 'Itaparica', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291620, 'Itapé', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291630, 'Itapebi', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291640, 'Itapetinga', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291650, 'Itapicuru', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291660, 'Itapitanga', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291670, 'Itaquara', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291680, 'Itarantim', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291685, 'Itatim', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291690, 'Itiruçu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291700, 'Itiúba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291710, 'Itororó', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291720, 'Ituaçu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291730, 'Ituberá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291733, 'Iuiú', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291735, 'Jaborandi', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291740, 'Jacaraci', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291750, 'Jacobina', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291760, 'Jaguaquara', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291770, 'Jaguarari', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291780, 'Jaguaripe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291790, 'Jandaíra', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291800, 'Jequié', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291810, 'Jeremoabo', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291820, 'Jiquiriçá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291830, 'Jitaúna', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291835, 'João Dourado', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291840, 'Juazeiro', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291845, 'Jucuruçu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291850, 'Jussara', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291855, 'Jussari', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291860, 'Jussiape', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291870, 'Lafaiete Coutinho', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291875, 'Lagoa Real', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291880, 'Laje', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291890, 'Lajedão', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291900, 'Lajedinho', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291905, 'Lajedo do Tabocal', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291910, 'Lamarão', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291915, 'Lapão', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291920, 'Lauro de Freitas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291930, 'Lençóis', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291940, 'Licínio de Almeida', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291950, 'Livramento de Nossa Senhora', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291955, 'Luís Eduardo Magalhães', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291960, 'Macajuba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291970, 'Macarani', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291980, 'Macaúbas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291990, 'Macururé', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291992, 'Madre de Deus', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (291995, 'Maetinga', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292000, 'Maiquinique', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292010, 'Mairi', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292020, 'Malhada', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292030, 'Malhada de Pedras', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292040, 'Manoel Vitorino', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292045, 'Mansidão', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292050, 'Maracás', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292060, 'Maragogipe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292070, 'Maraú', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292080, 'Marcionílio Souza', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292090, 'Mascote', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292100, 'Mata de São João', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292105, 'Matina', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292110, 'Medeiros Neto', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292120, 'Miguel Calmon', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292130, 'Milagres', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292140, 'Mirangaba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292145, 'Mirante', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292150, 'Monte Santo', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292160, 'Morpará', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292170, 'Morro do Chapéu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292180, 'Mortugaba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292190, 'Mucugê', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292200, 'Mucuri', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292205, 'Mulungu do Morro', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292210, 'Mundo Novo', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292220, 'Muniz Ferreira', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292225, 'Muquém de São Francisco', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292230, 'Muritiba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292240, 'Mutuípe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292250, 'Nazaré', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292260, 'Nilo Peçanha', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292265, 'Nordestina', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292270, 'Nova Canaã', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292273, 'Nova Fátima', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292275, 'Nova Ibiá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292280, 'Nova Itarana', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292285, 'Nova Redenção', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292290, 'Nova Soure', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292300, 'Nova Viçosa', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292303, 'Novo Horizonte', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292305, 'Novo Triunfo', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292310, 'Olindina', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292320, 'Oliveira dos Brejinhos', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292330, 'Ouriçangas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292335, 'Ourolândia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292340, 'Palmas de Monte Alto', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292350, 'Palmeiras', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292360, 'Paramirim', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292370, 'Paratinga', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292380, 'Paripiranga', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292390, 'Pau Brasil', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292400, 'Paulo Afonso', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292405, 'Pé de Serra', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292410, 'Pedrão', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292420, 'Pedro Alexandre', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292430, 'Piatã', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292440, 'Pilão Arcado', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292450, 'Pindaí', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292460, 'Pindobaçu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292465, 'Pintadas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292467, 'Piraí do Norte', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292470, 'Piripá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292480, 'Piritiba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292490, 'Planaltino', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292500, 'Planalto', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292510, 'Poções', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292520, 'Pojuca', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292525, 'Ponto Novo', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292530, 'Porto Seguro', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292540, 'Potiraguá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292550, 'Prado', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292560, 'Presidente Dutra', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292570, 'Presidente Jânio Quadros', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292575, 'Presidente Tancredo Neves', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292580, 'Queimadas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292590, 'Quijingue', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292593, 'Quixabeira', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292595, 'Rafael Jambeiro', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292600, 'Remanso', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292610, 'Retirolândia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292620, 'Riachão das Neves', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292630, 'Riachão do Jacuípe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292640, 'Riacho de Santana', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292650, 'Ribeira do Amparo', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292660, 'Ribeira do Pombal', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292665, 'Ribeirão do Largo', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292670, 'Rio de Contas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292680, 'Rio do Antônio', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292690, 'Rio do Pires', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292700, 'Rio Real', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292710, 'Rodelas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292720, 'Ruy Barbosa', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292730, 'Salinas da Margarida', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292740, 'Salvador', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292750, 'Santa Bárbara', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292760, 'Santa Brígida', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292770, 'Santa Cruz Cabrália', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292780, 'Santa Cruz da Vitória', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292790, 'Santa Inês', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292800, 'Santaluz', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292805, 'Santa Luzia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292810, 'Santa Maria da Vitória', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292820, 'Santana', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292830, 'Santanópolis', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292840, 'Santa Rita de Cássia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292850, 'Santa Teresinha', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292860, 'Santo Amaro', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292870, 'Santo Antônio de Jesus', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292880, 'Santo Estêvão', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292890, 'São Desidério', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292895, 'São Domingos', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292900, 'São Félix', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292905, 'São Félix do Coribe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292910, 'São Felipe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292920, 'São Francisco do Conde', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292925, 'São Gabriel', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292930, 'São Gonçalo dos Campos', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292935, 'São José da Vitória', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292937, 'São José do Jacuípe', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292940, 'São Miguel das Matas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292950, 'São Sebastião do Passé', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292960, 'Sapeaçu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292970, 'Sátiro Dias', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292975, 'Saubara', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292980, 'Saúde', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (292990, 'Seabra', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293000, 'Sebastião Laranjeiras', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293010, 'Senhor do Bonfim', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293015, 'Serra do Ramalho', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293020, 'Sento Sé', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293030, 'Serra Dourada', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293040, 'Serra Preta', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293050, 'Serrinha', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293060, 'Serrolândia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293070, 'Simões Filho', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293075, 'Sítio do Mato', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293076, 'Sítio do Quinto', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293077, 'Sobradinho', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293080, 'Souto Soares', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293090, 'Tabocas do Brejo Velho', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293100, 'Tanhaçu', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293105, 'Tanque Novo', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293110, 'Tanquinho', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293120, 'Taperoá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293130, 'Tapiramutá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293135, 'Teixeira de Freitas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293140, 'Teodoro Sampaio', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293150, 'Teofilândia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293160, 'Teolândia', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293170, 'Terra Nova', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293180, 'Tremedal', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293190, 'Tucano', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293200, 'Uauá', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293210, 'Ubaíra', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293220, 'Ubaitaba', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293230, 'Ubatã', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293240, 'Uibaí', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293245, 'Umburanas', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293250, 'Una', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293260, 'Urandi', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293270, 'Uruçuca', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293280, 'Utinga', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293290, 'Valença', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293300, 'Valente', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293305, 'Várzea da Roça', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293310, 'Várzea do Poço', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293315, 'Várzea Nova', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293317, 'Varzedo', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293320, 'Vera Cruz', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293325, 'Vereda', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293330, 'Vitória da Conquista', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293340, 'Wagner', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293345, 'Wanderley', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293350, 'Wenceslau Guimarães', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (293360, 'Xique-Xique', 29);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310010, 'Abadia dos Dourados', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310020, 'Abaeté', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310030, 'Abre Campo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310040, 'Acaiaca', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310050, 'Açucena', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310060, 'Água Boa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310070, 'Água Comprida', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310080, 'Aguanil', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310090, 'Águas Formosas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310100, 'Águas Vermelhas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310110, 'Aimorés', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310120, 'Aiuruoca', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310130, 'Alagoa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310140, 'Albertina', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310150, 'Além Paraíba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310160, 'Alfenas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310163, 'Alfredo Vasconcelos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310170, 'Almenara', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310180, 'Alpercata', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310190, 'Alpinópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310200, 'Alterosa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310205, 'Alto Caparaó', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310210, 'Alto Rio Doce', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310220, 'Alvarenga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310230, 'Alvinópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310240, 'Alvorada de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310250, 'Amparo do Serra', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310260, 'Andradas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310270, 'Cachoeira de Pajeú', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310280, 'Andrelândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310285, 'Angelândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310290, 'Antônio Carlos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310300, 'Antônio Dias', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310310, 'Antônio Prado de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310320, 'Araçaí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310330, 'Aracitaba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310340, 'Araçuaí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310350, 'Araguari', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310360, 'Arantina', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310370, 'Araponga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310375, 'Araporã', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310380, 'Arapuá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310390, 'Araújos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310400, 'Araxá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310410, 'Arceburgo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310420, 'Arcos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310430, 'Areado', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310440, 'Argirita', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310445, 'Aricanduva', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310450, 'Arinos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310460, 'Astolfo Dutra', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310470, 'Ataléia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310480, 'Augusto de Lima', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310490, 'Baependi', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310500, 'Baldim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310510, 'Bambuí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310520, 'Bandeira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310530, 'Bandeira do Sul', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310540, 'Barão de Cocais', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310550, 'Barão de Monte Alto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310560, 'Barbacena', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310570, 'Barra Longa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310590, 'Barroso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310600, 'Bela Vista de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310610, 'Belmiro Braga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310620, 'Belo Horizonte', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310630, 'Belo Oriente', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310640, 'Belo Vale', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310650, 'Berilo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310660, 'Bertópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310665, 'Berizal', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310670, 'Betim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310680, 'Bias Fortes', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310690, 'Bicas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310700, 'Biquinhas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310710, 'Boa Esperança', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310720, 'Bocaina de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310730, 'Bocaiúva', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310740, 'Bom Despacho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310750, 'Bom Jardim de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310760, 'Bom Jesus da Penha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310770, 'Bom Jesus do Amparo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310780, 'Bom Jesus do Galho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310790, 'Bom Repouso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310800, 'Bom Sucesso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310810, 'Bonfim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310820, 'Bonfinópolis de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310825, 'Bonito de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310830, 'Borda da Mata', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310840, 'Botelhos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310850, 'Botumirim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310855, 'Brasilândia de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310860, 'Brasília de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310870, 'Brás Pires', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310880, 'Braúnas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310890, 'Brasópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310900, 'Brumadinho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310910, 'Bueno Brandão', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310920, 'Buenópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310925, 'Bugre', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310930, 'Buritis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310940, 'Buritizeiro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310945, 'Cabeceira Grande', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310950, 'Cabo Verde', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310960, 'Cachoeira da Prata', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310970, 'Cachoeira de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310980, 'Cachoeira Dourada', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (310990, 'Caetanópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311000, 'Caeté', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311010, 'Caiana', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311020, 'Cajuri', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311030, 'Caldas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311040, 'Camacho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311050, 'Camanducaia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311060, 'Cambuí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311070, 'Cambuquira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311080, 'Campanário', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311090, 'Campanha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311100, 'Campestre', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311110, 'Campina Verde', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311115, 'Campo Azul', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311120, 'Campo Belo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311130, 'Campo do Meio', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311140, 'Campo Florido', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311150, 'Campos Altos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311160, 'Campos Gerais', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311170, 'Canaã', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311180, 'Canápolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311190, 'Cana Verde', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311200, 'Candeias', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311205, 'Cantagalo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311210, 'Caparaó', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311220, 'Capela Nova', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311230, 'Capelinha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311240, 'Capetinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311250, 'Capim Branco', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311260, 'Capinópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311265, 'Capitão Andrade', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311270, 'Capitão Enéas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311280, 'Capitólio', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311290, 'Caputira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311300, 'Caraí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311310, 'Caranaíba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311320, 'Carandaí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311330, 'Carangola', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311340, 'Caratinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311350, 'Carbonita', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311360, 'Careaçu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311370, 'Carlos Chagas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311380, 'Carmésia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311390, 'Carmo da Cachoeira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311400, 'Carmo da Mata', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311410, 'Carmo de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311420, 'Carmo do Cajuru', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311430, 'Carmo do Paranaíba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311440, 'Carmo do Rio Claro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311450, 'Carmópolis de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311455, 'Carneirinho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311460, 'Carrancas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311470, 'Carvalhópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311480, 'Carvalhos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311490, 'Casa Grande', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311500, 'Cascalho Rico', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311510, 'Cássia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311520, 'Conceição da Barra de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311530, 'Cataguases', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311535, 'Catas Altas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311540, 'Catas Altas da Noruega', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311545, 'Catuji', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311547, 'Catuti', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311550, 'Caxambu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311560, 'Cedro do Abaeté', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311570, 'Central de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311580, 'Centralina', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311590, 'Chácara', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311600, 'Chalé', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311610, 'Chapada do Norte', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311615, 'Chapada Gaúcha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311620, 'Chiador', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311630, 'Cipotânea', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311640, 'Claraval', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311650, 'Claro dos Poções', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311660, 'Cláudio', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311670, 'Coimbra', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311680, 'Coluna', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311690, 'Comendador Gomes', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311700, 'Comercinho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311710, 'Conceição da Aparecida', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311720, 'Conceição das Pedras', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311730, 'Conceição das Alagoas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311740, 'Conceição de Ipanema', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311750, 'Conceição do Mato Dentro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311760, 'Conceição do Pará', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311770, 'Conceição do Rio Verde', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311780, 'Conceição dos Ouros', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311783, 'Cônego Marinho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311787, 'Confins', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311790, 'Congonhal', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311800, 'Congonhas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311810, 'Congonhas do Norte', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311820, 'Conquista', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311830, 'Conselheiro Lafaiete', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311840, 'Conselheiro Pena', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311850, 'Consolação', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311860, 'Contagem', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311870, 'Coqueiral', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311880, 'Coração de Jesus', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311890, 'Cordisburgo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311900, 'Cordislândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311910, 'Corinto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311920, 'Coroaci', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311930, 'Coromandel', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311940, 'Coronel Fabriciano', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311950, 'Coronel Murta', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311960, 'Coronel Pacheco', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311970, 'Coronel Xavier Chaves', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311980, 'Córrego Danta', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311990, 'Córrego do Bom Jesus', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (311995, 'Córrego Fundo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312000, 'Córrego Novo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312010, 'Couto de Magalhães de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312015, 'Crisólita', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312020, 'Cristais', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312030, 'Cristália', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312040, 'Cristiano Otoni', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312050, 'Cristina', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312060, 'Crucilândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312070, 'Cruzeiro da Fortaleza', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312080, 'Cruzília', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312083, 'Cuparaque', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312087, 'Curral de Dentro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312090, 'Curvelo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312100, 'Datas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312110, 'Delfim Moreira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312120, 'Delfinópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312125, 'Delta', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312130, 'Descoberto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312140, 'Desterro de Entre Rios', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312150, 'Desterro do Melo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312160, 'Diamantina', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312170, 'Diogo de Vasconcelos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312180, 'Dionísio', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312190, 'Divinésia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312200, 'Divino', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312210, 'Divino das Laranjeiras', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312220, 'Divinolândia de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312230, 'Divinópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312235, 'Divisa Alegre', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312240, 'Divisa Nova', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312245, 'Divisópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312247, 'Dom Bosco', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312250, 'Dom Cavati', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312260, 'Dom Joaquim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312270, 'Dom Silvério', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312280, 'Dom Viçoso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312290, 'Dona Eusébia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312300, 'Dores de Campos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312310, 'Dores de Guanhães', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312320, 'Dores do Indaiá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312330, 'Dores do Turvo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312340, 'Doresópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312350, 'Douradoquara', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312352, 'Durandé', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312360, 'Elói Mendes', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312370, 'Engenheiro Caldas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312380, 'Engenheiro Navarro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312385, 'Entre Folhas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312390, 'Entre Rios de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312400, 'Ervália', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312410, 'Esmeraldas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312420, 'Espera Feliz', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312430, 'Espinosa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312440, 'Espírito Santo do Dourado', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312450, 'Estiva', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312460, 'Estrela Dalva', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312470, 'Estrela do Indaiá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312480, 'Estrela do Sul', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312490, 'Eugenópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312500, 'Ewbank da Câmara', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312510, 'Extrema', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312520, 'Fama', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312530, 'Faria Lemos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312540, 'Felício dos Santos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312550, 'São Gonçalo do Rio Preto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312560, 'Felisburgo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312570, 'Felixlândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312580, 'Fernandes Tourinho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312590, 'Ferros', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312595, 'Fervedouro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312600, 'Florestal', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312610, 'Formiga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312620, 'Formoso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312630, 'Fortaleza de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312640, 'Fortuna de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312650, 'Francisco Badaró', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312660, 'Francisco Dumont', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312670, 'Francisco Sá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312675, 'Franciscópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312680, 'Frei Gaspar', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312690, 'Frei Inocêncio', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312695, 'Frei Lagonegro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312700, 'Fronteira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312705, 'Fronteira dos Vales', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312707, 'Fruta de Leite', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312710, 'Frutal', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312720, 'Funilândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312730, 'Galiléia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312733, 'Gameleiras', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312735, 'Glaucilândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312737, 'Goiabeira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312738, 'Goianá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312740, 'Gonçalves', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312750, 'Gonzaga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312760, 'Gouveia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312770, 'Governador Valadares', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312780, 'Grão Mogol', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312790, 'Grupiara', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312800, 'Guanhães', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312810, 'Guapé', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312820, 'Guaraciaba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312825, 'Guaraciama', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312830, 'Guaranésia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312840, 'Guarani', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312850, 'Guarará', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312860, 'Guarda-Mor', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312870, 'Guaxupé', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312880, 'Guidoval', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312890, 'Guimarânia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312900, 'Guiricema', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312910, 'Gurinhatã', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312920, 'Heliodora', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312930, 'Iapu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312940, 'Ibertioga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312950, 'Ibiá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312960, 'Ibiaí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312965, 'Ibiracatu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312970, 'Ibiraci', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312980, 'Ibirité', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (312990, 'Ibitiúra de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313000, 'Ibituruna', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313005, 'Icaraí de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313010, 'Igarapé', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313020, 'Igaratinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313030, 'Iguatama', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313040, 'Ijaci', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313050, 'Ilicínea', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313055, 'Imbé de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313060, 'Inconfidentes', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313065, 'Indaiabira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313070, 'Indianópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313080, 'Ingaí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313090, 'Inhapim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313100, 'Inhaúma', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313110, 'Inimutaba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313115, 'Ipaba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313120, 'Ipanema', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313130, 'Ipatinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313140, 'Ipiaçu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313150, 'Ipuiúna', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313160, 'Iraí de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313170, 'Itabira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313180, 'Itabirinha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313190, 'Itabirito', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313200, 'Itacambira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313210, 'Itacarambi', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313220, 'Itaguara', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313230, 'Itaipé', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313240, 'Itajubá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313250, 'Itamarandiba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313260, 'Itamarati de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313270, 'Itambacuri', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313280, 'Itambé do Mato Dentro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313290, 'Itamogi', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313300, 'Itamonte', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313310, 'Itanhandu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313320, 'Itanhomi', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313330, 'Itaobim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313340, 'Itapagipe', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313350, 'Itapecerica', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313360, 'Itapeva', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313370, 'Itatiaiuçu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313375, 'Itaú de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313380, 'Itaúna', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313390, 'Itaverava', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313400, 'Itinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313410, 'Itueta', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313420, 'Ituiutaba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313430, 'Itumirim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313440, 'Iturama', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313450, 'Itutinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313460, 'Jaboticatubas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313470, 'Jacinto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313480, 'Jacuí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313490, 'Jacutinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313500, 'Jaguaraçu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313505, 'Jaíba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313507, 'Jampruca', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313510, 'Janaúba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313520, 'Januária', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313530, 'Japaraíba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313535, 'Japonvar', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313540, 'Jeceaba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313545, 'Jenipapo de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313550, 'Jequeri', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313560, 'Jequitaí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313570, 'Jequitibá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313580, 'Jequitinhonha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313590, 'Jesuânia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313600, 'Joaíma', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313610, 'Joanésia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313620, 'João Monlevade', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313630, 'João Pinheiro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313640, 'Joaquim Felício', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313650, 'Jordânia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313652, 'José Gonçalves de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313655, 'José Raydan', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313657, 'Josenópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313660, 'Nova União', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313665, 'Juatuba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313670, 'Juiz de Fora', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313680, 'Juramento', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313690, 'Juruaia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313695, 'Juvenília', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313700, 'Ladainha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313710, 'Lagamar', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313720, 'Lagoa da Prata', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313730, 'Lagoa dos Patos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313740, 'Lagoa Dourada', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313750, 'Lagoa Formosa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313753, 'Lagoa Grande', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313760, 'Lagoa Santa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313770, 'Lajinha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313780, 'Lambari', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313790, 'Lamim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313800, 'Laranjal', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313810, 'Lassance', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313820, 'Lavras', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313830, 'Leandro Ferreira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313835, 'Leme do Prado', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313840, 'Leopoldina', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313850, 'Liberdade', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313860, 'Lima Duarte', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313862, 'Limeira do Oeste', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313865, 'Lontra', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313867, 'Luisburgo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313868, 'Luislândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313870, 'Luminárias', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313880, 'Luz', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313890, 'Machacalis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313900, 'Machado', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313910, 'Madre de Deus de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313920, 'Malacacheta', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313925, 'Mamonas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313930, 'Manga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313940, 'Manhuaçu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313950, 'Manhumirim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313960, 'Mantena', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313970, 'Maravilhas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313980, 'Mar de Espanha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (313990, 'Maria da Fé', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314000, 'Mariana', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314010, 'Marilac', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314015, 'Mário Campos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314020, 'Maripá de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314030, 'Marliéria', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314040, 'Marmelópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314050, 'Martinho Campos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314053, 'Martins Soares', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314055, 'Mata Verde', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314060, 'Materlândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314070, 'Mateus Leme', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314080, 'Matias Barbosa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314085, 'Matias Cardoso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314090, 'Matipó', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314100, 'Mato Verde', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314110, 'Matozinhos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314120, 'Matutina', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314130, 'Medeiros', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314140, 'Medina', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314150, 'Mendes Pimentel', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314160, 'Mercês', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314170, 'Mesquita', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314180, 'Minas Novas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314190, 'Minduri', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314200, 'Mirabela', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314210, 'Miradouro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314220, 'Miraí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314225, 'Miravânia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314230, 'Moeda', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314240, 'Moema', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314250, 'Monjolos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314260, 'Monsenhor Paulo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314270, 'Montalvânia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314280, 'Monte Alegre de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314290, 'Monte Azul', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314300, 'Monte Belo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314310, 'Monte Carmelo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314315, 'Monte Formoso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314320, 'Monte Santo de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314330, 'Montes Claros', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314340, 'Monte Sião', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314345, 'Montezuma', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314350, 'Morada Nova de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314360, 'Morro da Garça', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314370, 'Morro do Pilar', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314380, 'Munhoz', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314390, 'Muriaé', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314400, 'Mutum', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314410, 'Muzambinho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314420, 'Nacip Raydan', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314430, 'Nanuque', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314435, 'Naque', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314437, 'Natalândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314440, 'Natércia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314450, 'Nazareno', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314460, 'Nepomuceno', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314465, 'Ninheira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314467, 'Nova Belém', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314470, 'Nova Era', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314480, 'Nova Lima', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314490, 'Nova Módica', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314500, 'Nova Ponte', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314505, 'Nova Porteirinha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314510, 'Nova Resende', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314520, 'Nova Serrana', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314530, 'Novo Cruzeiro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314535, 'Novo Oriente de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314537, 'Novorizonte', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314540, 'Olaria', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314545, 'Olhos-d''Água', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314550, 'Olímpio Noronha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314560, 'Oliveira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314570, 'Oliveira Fortes', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314580, 'Onça de Pitangui', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314585, 'Oratórios', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314587, 'Orizânia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314590, 'Ouro Branco', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314600, 'Ouro Fino', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314610, 'Ouro Preto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314620, 'Ouro Verde de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314625, 'Padre Carvalho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314630, 'Padre Paraíso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314640, 'Paineiras', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314650, 'Pains', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314655, 'Pai Pedro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314660, 'Paiva', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314670, 'Palma', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314675, 'Palmópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314690, 'Papagaios', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314700, 'Paracatu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314710, 'Pará de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314720, 'Paraguaçu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314730, 'Paraisópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314740, 'Paraopeba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314750, 'Passabém', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314760, 'Passa Quatro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314770, 'Passa Tempo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314780, 'Passa-Vinte', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314790, 'Passos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314795, 'Patis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314800, 'Patos de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314810, 'Patrocínio', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314820, 'Patrocínio do Muriaé', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314830, 'Paula Cândido', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314840, 'Paulistas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314850, 'Pavão', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314860, 'Peçanha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314870, 'Pedra Azul', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314875, 'Pedra Bonita', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314880, 'Pedra do Anta', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314890, 'Pedra do Indaiá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314900, 'Pedra Dourada', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314910, 'Pedralva', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314915, 'Pedras de Maria da Cruz', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314920, 'Pedrinópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314930, 'Pedro Leopoldo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314940, 'Pedro Teixeira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314950, 'Pequeri', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314960, 'Pequi', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314970, 'Perdigão', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314980, 'Perdizes', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314990, 'Perdões', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (314995, 'Periquito', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315000, 'Pescador', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315010, 'Piau', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315015, 'Piedade de Caratinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315020, 'Piedade de Ponte Nova', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315030, 'Piedade do Rio Grande', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315040, 'Piedade dos Gerais', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315050, 'Pimenta', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315053, 'Pingo-d''Água', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315057, 'Pintópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315060, 'Piracema', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315070, 'Pirajuba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315080, 'Piranga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315090, 'Piranguçu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315100, 'Piranguinho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315110, 'Pirapetinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315120, 'Pirapora', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315130, 'Piraúba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315140, 'Pitangui', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315150, 'Piumhi', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315160, 'Planura', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315170, 'Poço Fundo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315180, 'Poços de Caldas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315190, 'Pocrane', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315200, 'Pompéu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315210, 'Ponte Nova', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315213, 'Ponto Chique', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315217, 'Ponto dos Volantes', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315220, 'Porteirinha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315230, 'Porto Firme', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315240, 'Poté', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315250, 'Pouso Alegre', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315260, 'Pouso Alto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315270, 'Prados', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315280, 'Prata', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315290, 'Pratápolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315300, 'Pratinha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315310, 'Presidente Bernardes', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315320, 'Presidente Juscelino', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315330, 'Presidente Kubitschek', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315340, 'Presidente Olegário', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315350, 'Alto Jequitibá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315360, 'Prudente de Morais', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315370, 'Quartel Geral', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315380, 'Queluzito', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315390, 'Raposos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315400, 'Raul Soares', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315410, 'Recreio', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315415, 'Reduto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315420, 'Resende Costa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315430, 'Resplendor', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315440, 'Ressaquinha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315445, 'Riachinho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315450, 'Riacho dos Machados', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315460, 'Ribeirão das Neves', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315470, 'Ribeirão Vermelho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315480, 'Rio Acima', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315490, 'Rio Casca', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315500, 'Rio Doce', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315510, 'Rio do Prado', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315520, 'Rio Espera', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315530, 'Rio Manso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315540, 'Rio Novo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315550, 'Rio Paranaíba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315560, 'Rio Pardo de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315570, 'Rio Piracicaba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315580, 'Rio Pomba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315590, 'Rio Preto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315600, 'Rio Vermelho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315610, 'Ritápolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315620, 'Rochedo de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315630, 'Rodeiro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315640, 'Romaria', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315645, 'Rosário da Limeira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315650, 'Rubelita', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315660, 'Rubim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315670, 'Sabará', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315680, 'Sabinópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315690, 'Sacramento', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315700, 'Salinas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315710, 'Salto da Divisa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315720, 'Santa Bárbara', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315725, 'Santa Bárbara do Leste', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315727, 'Santa Bárbara do Monte Verde', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315730, 'Santa Bárbara do Tugúrio', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315733, 'Santa Cruz de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315737, 'Santa Cruz de Salinas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315740, 'Santa Cruz do Escalvado', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315750, 'Santa Efigênia de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315760, 'Santa Fé de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315765, 'Santa Helena de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315770, 'Santa Juliana', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315780, 'Santa Luzia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315790, 'Santa Margarida', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315800, 'Santa Maria de Itabira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315810, 'Santa Maria do Salto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315820, 'Santa Maria do Suaçuí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315830, 'Santana da Vargem', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315840, 'Santana de Cataguases', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315850, 'Santana de Pirapama', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315860, 'Santana do Deserto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315870, 'Santana do Garambéu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315880, 'Santana do Jacaré', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315890, 'Santana do Manhuaçu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315895, 'Santana do Paraíso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315900, 'Santana do Riacho', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315910, 'Santana dos Montes', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315920, 'Santa Rita de Caldas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315930, 'Santa Rita de Jacutinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315935, 'Santa Rita de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315940, 'Santa Rita de Ibitipoca', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315950, 'Santa Rita do Itueto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315960, 'Santa Rita do Sapucaí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315970, 'Santa Rosa da Serra', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315980, 'Santa Vitória', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (315990, 'Santo Antônio do Amparo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316000, 'Santo Antônio do Aventureiro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316010, 'Santo Antônio do Grama', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316020, 'Santo Antônio do Itambé', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316030, 'Santo Antônio do Jacinto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316040, 'Santo Antônio do Monte', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316045, 'Santo Antônio do Retiro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316050, 'Santo Antônio do Rio Abaixo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316060, 'Santo Hipólito', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316070, 'Santos Dumont', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316080, 'São Bento Abade', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316090, 'São Brás do Suaçuí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316095, 'São Domingos das Dores', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316100, 'São Domingos do Prata', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316105, 'São Félix de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316110, 'São Francisco', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316120, 'São Francisco de Paula', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316130, 'São Francisco de Sales', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316140, 'São Francisco do Glória', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316150, 'São Geraldo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316160, 'São Geraldo da Piedade', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316165, 'São Geraldo do Baixio', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316170, 'São Gonçalo do Abaeté', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316180, 'São Gonçalo do Pará', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316190, 'São Gonçalo do Rio Abaixo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316200, 'São Gonçalo do Sapucaí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316210, 'São Gotardo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316220, 'São João Batista do Glória', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316225, 'São João da Lagoa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316230, 'São João da Mata', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316240, 'São João da Ponte', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316245, 'São João das Missões', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316250, 'São João del Rei', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316255, 'São João do Manhuaçu', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316257, 'São João do Manteninha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316260, 'São João do Oriente', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316265, 'São João do Pacuí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316270, 'São João do Paraíso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316280, 'São João Evangelista', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316290, 'São João Nepomuceno', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316292, 'São Joaquim de Bicas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316294, 'São José da Barra', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316295, 'São José da Lapa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316300, 'São José da Safira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316310, 'São José da Varginha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316320, 'São José do Alegre', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316330, 'São José do Divino', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316340, 'São José do Goiabal', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316350, 'São José do Jacuri', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316360, 'São José do Mantimento', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316370, 'São Lourenço', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316380, 'São Miguel do Anta', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316390, 'São Pedro da União', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316400, 'São Pedro dos Ferros', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316410, 'São Pedro do Suaçuí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316420, 'São Romão', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316430, 'São Roque de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316440, 'São Sebastião da Bela Vista', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316443, 'São Sebastião da Vargem Alegre', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316447, 'São Sebastião do Anta', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316450, 'São Sebastião do Maranhão', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316460, 'São Sebastião do Oeste', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316470, 'São Sebastião do Paraíso', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316480, 'São Sebastião do Rio Preto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316490, 'São Sebastião do Rio Verde', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316500, 'São Tiago', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316510, 'São Tomás de Aquino', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316520, 'São Thomé das Letras', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316530, 'São Vicente de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316540, 'Sapucaí-Mirim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316550, 'Sardoá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316553, 'Sarzedo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316555, 'Setubinha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316556, 'Sem-Peixe', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316557, 'Senador Amaral', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316560, 'Senador Cortes', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316570, 'Senador Firmino', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316580, 'Senador José Bento', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316590, 'Senador Modestino Gonçalves', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316600, 'Senhora de Oliveira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316610, 'Senhora do Porto', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316620, 'Senhora dos Remédios', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316630, 'Sericita', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316640, 'Seritinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316650, 'Serra Azul de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316660, 'Serra da Saudade', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316670, 'Serra dos Aimorés', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316680, 'Serra do Salitre', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316690, 'Serrania', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316695, 'Serranópolis de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316700, 'Serranos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316710, 'Serro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316720, 'Sete Lagoas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316730, 'Silveirânia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316740, 'Silvianópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316750, 'Simão Pereira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316760, 'Simonésia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316770, 'Sobrália', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316780, 'Soledade de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316790, 'Tabuleiro', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316800, 'Taiobeiras', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316805, 'Taparuba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316810, 'Tapira', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316820, 'Tapiraí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316830, 'Taquaraçu de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316840, 'Tarumirim', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316850, 'Teixeiras', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316860, 'Teófilo Otoni', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316870, 'Timóteo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316880, 'Tiradentes', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316890, 'Tiros', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316900, 'Tocantins', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316905, 'Tocos do Moji', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316910, 'Toledo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316920, 'Tombos', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316930, 'Três Corações', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316935, 'Três Marias', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316940, 'Três Pontas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316950, 'Tumiritinga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316960, 'Tupaciguara', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316970, 'Turmalina', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316980, 'Turvolândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (316990, 'Ubá', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317000, 'Ubaí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317005, 'Ubaporanga', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317010, 'Uberaba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317020, 'Uberlândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317030, 'Umburatiba', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317040, 'Unaí', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317043, 'União de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317047, 'Uruana de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317050, 'Urucânia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317052, 'Urucuia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317057, 'Vargem Alegre', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317060, 'Vargem Bonita', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317065, 'Vargem Grande do Rio Pardo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317070, 'Varginha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317075, 'Varjão de Minas', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317080, 'Várzea da Palma', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317090, 'Varzelândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317100, 'Vazante', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317103, 'Verdelândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317107, 'Veredinha', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317110, 'Veríssimo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317115, 'Vermelho Novo', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317120, 'Vespasiano', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317130, 'Viçosa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317140, 'Vieiras', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317150, 'Mathias Lobato', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317160, 'Virgem da Lapa', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317170, 'Virgínia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317180, 'Virginópolis', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317190, 'Virgolândia', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317200, 'Visconde do Rio Branco', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317210, 'Volta Grande', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (317220, 'Wenceslau Braz', 31);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320010, 'Afonso Cláudio', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320013, 'Águia Branca', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320016, 'Água Doce do Norte', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320020, 'Alegre', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320030, 'Alfredo Chaves', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320035, 'Alto Rio Novo', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320040, 'Anchieta', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320050, 'Apiacá', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320060, 'Aracruz', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320070, 'Atilio Vivacqua', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320080, 'Baixo Guandu', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320090, 'Barra de São Francisco', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320100, 'Boa Esperança', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320110, 'Bom Jesus do Norte', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320115, 'Brejetuba', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320120, 'Cachoeiro de Itapemirim', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320130, 'Cariacica', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320140, 'Castelo', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320150, 'Colatina', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320160, 'Conceição da Barra', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320170, 'Conceição do Castelo', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320180, 'Divino de São Lourenço', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320190, 'Domingos Martins', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320200, 'Dores do Rio Preto', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320210, 'Ecoporanga', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320220, 'Fundão', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320225, 'Governador Lindenberg', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320230, 'Guaçuí', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320240, 'Guarapari', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320245, 'Ibatiba', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320250, 'Ibiraçu', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320255, 'Ibitirama', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320260, 'Iconha', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320265, 'Irupi', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320270, 'Itaguaçu', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320280, 'Itapemirim', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320290, 'Itarana', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320300, 'Iúna', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320305, 'Jaguaré', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320310, 'Jerônimo Monteiro', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320313, 'João Neiva', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320316, 'Laranja da Terra', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320320, 'Linhares', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320330, 'Mantenópolis', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320332, 'Marataízes', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320334, 'Marechal Floriano', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320335, 'Marilândia', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320340, 'Mimoso do Sul', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320350, 'Montanha', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320360, 'Mucurici', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320370, 'Muniz Freire', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320380, 'Muqui', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320390, 'Nova Venécia', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320400, 'Pancas', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320405, 'Pedro Canário', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320410, 'Pinheiros', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320420, 'Piúma', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320425, 'Ponto Belo', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320430, 'Presidente Kennedy', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320435, 'Rio Bananal', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320440, 'Rio Novo do Sul', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320450, 'Santa Leopoldina', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320455, 'Santa Maria de Jetibá', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320460, 'Santa Teresa', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320465, 'São Domingos do Norte', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320470, 'São Gabriel da Palha', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320480, 'São José do Calçado', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320490, 'São Mateus', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320495, 'São Roque do Canaã', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320500, 'Serra', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320501, 'Sooretama', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320503, 'Vargem Alta', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320506, 'Venda Nova do Imigrante', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320510, 'Viana', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320515, 'Vila Pavão', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320517, 'Vila Valério', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320520, 'Vila Velha', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (320530, 'Vitória', 32);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330010, 'Angra dos Reis', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330015, 'Aperibé', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330020, 'Araruama', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330022, 'Areal', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330023, 'Armação dos Búzios', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330025, 'Arraial do Cabo', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330030, 'Barra do Piraí', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330040, 'Barra Mansa', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330045, 'Belford Roxo', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330050, 'Bom Jardim', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330060, 'Bom Jesus do Itabapoana', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330070, 'Cabo Frio', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330080, 'Cachoeiras de Macacu', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330090, 'Cambuci', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330093, 'Carapebus', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330095, 'Comendador Levy Gasparian', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330100, 'Campos dos Goytacazes', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330110, 'Cantagalo', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330115, 'Cardoso Moreira', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330120, 'Carmo', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330130, 'Casimiro de Abreu', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330140, 'Conceição de Macabu', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330150, 'Cordeiro', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330160, 'Duas Barras', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330170, 'Duque de Caxias', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330180, 'Engenheiro Paulo de Frontin', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330185, 'Guapimirim', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330187, 'Iguaba Grande', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330190, 'Itaboraí', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330200, 'Itaguaí', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330205, 'Italva', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330210, 'Itaocara', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330220, 'Itaperuna', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330225, 'Itatiaia', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330227, 'Japeri', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330230, 'Laje do Muriaé', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330240, 'Macaé', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330245, 'Macuco', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330250, 'Magé', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330260, 'Mangaratiba', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330270, 'Maricá', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330280, 'Mendes', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330285, 'Mesquita', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330290, 'Miguel Pereira', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330300, 'Miracema', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330310, 'Natividade', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330320, 'Nilópolis', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330330, 'Niterói', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330340, 'Nova Friburgo', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330350, 'Nova Iguaçu', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330360, 'Paracambi', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330370, 'Paraíba do Sul', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330380, 'Paraty', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330385, 'Paty do Alferes', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330390, 'Petrópolis', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330395, 'Pinheiral', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330400, 'Piraí', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330410, 'Porciúncula', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330411, 'Porto Real', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330412, 'Quatis', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330414, 'Queimados', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330415, 'Quissamã', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330420, 'Resende', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330430, 'Rio Bonito', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330440, 'Rio Claro', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330450, 'Rio das Flores', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330452, 'Rio das Ostras', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330455, 'Rio de Janeiro', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330460, 'Santa Maria Madalena', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330470, 'Santo Antônio de Pádua', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330475, 'São Francisco de Itabapoana', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330480, 'São Fidélis', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330490, 'São Gonçalo', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330500, 'São João da Barra', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330510, 'São João de Meriti', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330513, 'São José de Ubá', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330515, 'São José do Vale do Rio Preto', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330520, 'São Pedro da Aldeia', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330530, 'São Sebastião do Alto', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330540, 'Sapucaia', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330550, 'Saquarema', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330555, 'Seropédica', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330560, 'Silva Jardim', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330570, 'Sumidouro', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330575, 'Tanguá', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330580, 'Teresópolis', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330590, 'Trajano de Moraes', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330600, 'Três Rios', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330610, 'Valença', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330615, 'Varre-Sai', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330620, 'Vassouras', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (330630, 'Volta Redonda', 33);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350010, 'Adamantina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350020, 'Adolfo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350030, 'Aguaí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350040, 'Águas da Prata', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350050, 'Águas de Lindóia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350055, 'Águas de Santa Bárbara', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350060, 'Águas de São Pedro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350070, 'Agudos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350075, 'Alambari', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350080, 'Alfredo Marcondes', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350090, 'Altair', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350100, 'Altinópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350110, 'Alto Alegre', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350115, 'Alumínio', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350120, 'Álvares Florence', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350130, 'Álvares Machado', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350140, 'Álvaro de Carvalho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350150, 'Alvinlândia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350160, 'Americana', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350170, 'Américo Brasiliense', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350180, 'Américo de Campos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350190, 'Amparo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350200, 'Analândia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350210, 'Andradina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350220, 'Angatuba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350230, 'Anhembi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350240, 'Anhumas', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350250, 'Aparecida', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350260, 'Aparecida d''Oeste', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350270, 'Apiaí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350275, 'Araçariguama', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350280, 'Araçatuba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350290, 'Araçoiaba da Serra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350300, 'Aramina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350310, 'Arandu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350315, 'Arapeí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350320, 'Araraquara', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350330, 'Araras', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350335, 'Arco-Íris', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350340, 'Arealva', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350350, 'Areias', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350360, 'Areiópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350370, 'Ariranha', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350380, 'Artur Nogueira', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350390, 'Arujá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350395, 'Aspásia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350400, 'Assis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350410, 'Atibaia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350420, 'Auriflama', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350430, 'Avaí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350440, 'Avanhandava', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350450, 'Avaré', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350460, 'Bady Bassitt', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350470, 'Balbinos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350480, 'Bálsamo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350490, 'Bananal', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350500, 'Barão de Antonina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350510, 'Barbosa', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350520, 'Bariri', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350530, 'Barra Bonita', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350535, 'Barra do Chapéu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350540, 'Barra do Turvo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350550, 'Barretos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350560, 'Barrinha', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350570, 'Barueri', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350580, 'Bastos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350590, 'Batatais', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350600, 'Bauru', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350610, 'Bebedouro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350620, 'Bento de Abreu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350630, 'Bernardino de Campos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350635, 'Bertioga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350640, 'Bilac', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350650, 'Birigui', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350660, 'Biritiba-Mirim', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350670, 'Boa Esperança do Sul', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350680, 'Bocaina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350690, 'Bofete', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350700, 'Boituva', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350710, 'Bom Jesus dos Perdões', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350715, 'Bom Sucesso de Itararé', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350720, 'Borá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350730, 'Boracéia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350740, 'Borborema', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350745, 'Borebi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350750, 'Botucatu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350760, 'Bragança Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350770, 'Braúna', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350775, 'Brejo Alegre', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350780, 'Brodowski', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350790, 'Brotas', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350800, 'Buri', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350810, 'Buritama', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350820, 'Buritizal', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350830, 'Cabrália Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350840, 'Cabreúva', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350850, 'Caçapava', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350860, 'Cachoeira Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350870, 'Caconde', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350880, 'Cafelândia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350890, 'Caiabu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350900, 'Caieiras', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350910, 'Caiuá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350920, 'Cajamar', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350925, 'Cajati', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350930, 'Cajobi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350940, 'Cajuru', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350945, 'Campina do Monte Alegre', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350950, 'Campinas', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350960, 'Campo Limpo Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350970, 'Campos do Jordão', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350980, 'Campos Novos Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350990, 'Cananéia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (350995, 'Canas', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351000, 'Cândido Mota', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351010, 'Cândido Rodrigues', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351015, 'Canitar', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351020, 'Capão Bonito', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351030, 'Capela do Alto', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351040, 'Capivari', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351050, 'Caraguatatuba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351060, 'Carapicuíba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351070, 'Cardoso', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351080, 'Casa Branca', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351090, 'Cássia dos Coqueiros', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351100, 'Castilho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351110, 'Catanduva', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351120, 'Catiguá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351130, 'Cedral', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351140, 'Cerqueira César', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351150, 'Cerquilho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351160, 'Cesário Lange', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351170, 'Charqueada', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351190, 'Clementina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351200, 'Colina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351210, 'Colômbia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351220, 'Conchal', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351230, 'Conchas', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351240, 'Cordeirópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351250, 'Coroados', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351260, 'Coronel Macedo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351270, 'Corumbataí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351280, 'Cosmópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351290, 'Cosmorama', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351300, 'Cotia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351310, 'Cravinhos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351320, 'Cristais Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351330, 'Cruzália', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351340, 'Cruzeiro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351350, 'Cubatão', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351360, 'Cunha', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351370, 'Descalvado', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351380, 'Diadema', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351385, 'Dirce Reis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351390, 'Divinolândia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351400, 'Dobrada', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351410, 'Dois Córregos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351420, 'Dolcinópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351430, 'Dourado', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351440, 'Dracena', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351450, 'Duartina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351460, 'Dumont', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351470, 'Echaporã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351480, 'Eldorado', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351490, 'Elias Fausto', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351492, 'Elisiário', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351495, 'Embaúba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351500, 'Embu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351510, 'Embu-Guaçu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351512, 'Emilianópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351515, 'Engenheiro Coelho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351518, 'Espírito Santo do Pinhal', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351519, 'Espírito Santo do Turvo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351520, 'Estrela d''Oeste', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351530, 'Estrela do Norte', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351535, 'Euclides da Cunha Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351540, 'Fartura', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351550, 'Fernandópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351560, 'Fernando Prestes', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351565, 'Fernão', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351570, 'Ferraz de Vasconcelos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351580, 'Flora Rica', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351590, 'Floreal', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351600, 'Flórida Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351610, 'Florínia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351620, 'Franca', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351630, 'Francisco Morato', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351640, 'Franco da Rocha', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351650, 'Gabriel Monteiro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351660, 'Gália', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351670, 'Garça', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351680, 'Gastão Vidigal', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351685, 'Gavião Peixoto', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351690, 'General Salgado', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351700, 'Getulina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351710, 'Glicério', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351720, 'Guaiçara', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351730, 'Guaimbê', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351740, 'Guaíra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351750, 'Guapiaçu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351760, 'Guapiara', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351770, 'Guará', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351780, 'Guaraçaí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351790, 'Guaraci', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351800, 'Guarani d''Oeste', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351810, 'Guarantã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351820, 'Guararapes', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351830, 'Guararema', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351840, 'Guaratinguetá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351850, 'Guareí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351860, 'Guariba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351870, 'Guarujá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351880, 'Guarulhos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351885, 'Guatapará', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351890, 'Guzolândia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351900, 'Herculândia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351905, 'Holambra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351907, 'Hortolândia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351910, 'Iacanga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351920, 'Iacri', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351925, 'Iaras', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351930, 'Ibaté', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351940, 'Ibirá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351950, 'Ibirarema', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351960, 'Ibitinga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351970, 'Ibiúna', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351980, 'Icém', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (351990, 'Iepê', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352000, 'Igaraçu do Tietê', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352010, 'Igarapava', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352020, 'Igaratá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352030, 'Iguape', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352040, 'Ilhabela', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352042, 'Ilha Comprida', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352044, 'Ilha Solteira', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352050, 'Indaiatuba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352060, 'Indiana', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352070, 'Indiaporã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352080, 'Inúbia Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352090, 'Ipaussu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352100, 'Iperó', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352110, 'Ipeúna', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352115, 'Ipiguá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352120, 'Iporanga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352130, 'Ipuã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352140, 'Iracemápolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352150, 'Irapuã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352160, 'Irapuru', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352170, 'Itaberá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352180, 'Itaí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352190, 'Itajobi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352200, 'Itaju', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352210, 'Itanhaém', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352215, 'Itaóca', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352220, 'Itapecerica da Serra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352230, 'Itapetininga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352240, 'Itapeva', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352250, 'Itapevi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352260, 'Itapira', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352265, 'Itapirapuã Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352270, 'Itápolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352280, 'Itaporanga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352290, 'Itapuí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352300, 'Itapura', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352310, 'Itaquaquecetuba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352320, 'Itararé', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352330, 'Itariri', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352340, 'Itatiba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352350, 'Itatinga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352360, 'Itirapina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352370, 'Itirapuã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352380, 'Itobi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352390, 'Itu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352400, 'Itupeva', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352410, 'Ituverava', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352420, 'Jaborandi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352430, 'Jaboticabal', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352440, 'Jacareí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352450, 'Jaci', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352460, 'Jacupiranga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352470, 'Jaguariúna', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352480, 'Jales', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352490, 'Jambeiro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352500, 'Jandira', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352510, 'Jardinópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352520, 'Jarinu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352530, 'Jaú', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352540, 'Jeriquara', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352550, 'Joanópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352560, 'João Ramalho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352570, 'José Bonifácio', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352580, 'Júlio Mesquita', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352585, 'Jumirim', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352590, 'Jundiaí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352600, 'Junqueirópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352610, 'Juquiá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352620, 'Juquitiba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352630, 'Lagoinha', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352640, 'Laranjal Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352650, 'Lavínia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352660, 'Lavrinhas', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352670, 'Leme', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352680, 'Lençóis Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352690, 'Limeira', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352700, 'Lindóia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352710, 'Lins', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352720, 'Lorena', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352725, 'Lourdes', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352730, 'Louveira', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352740, 'Lucélia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352750, 'Lucianópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352760, 'Luís Antônio', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352770, 'Luiziânia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352780, 'Lupércio', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352790, 'Lutécia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352800, 'Macatuba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352810, 'Macaubal', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352820, 'Macedônia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352830, 'Magda', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352840, 'Mairinque', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352850, 'Mairiporã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352860, 'Manduri', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352870, 'Marabá Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352880, 'Maracaí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352885, 'Marapoama', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352890, 'Mariápolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352900, 'Marília', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352910, 'Marinópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352920, 'Martinópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352930, 'Matão', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352940, 'Mauá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352950, 'Mendonça', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352960, 'Meridiano', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352965, 'Mesópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352970, 'Miguelópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352980, 'Mineiros do Tietê', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (352990, 'Miracatu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353000, 'Mira Estrela', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353010, 'Mirandópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353020, 'Mirante do Paranapanema', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353030, 'Mirassol', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353040, 'Mirassolândia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353050, 'Mococa', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353060, 'Mogi das Cruzes', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353070, 'Mogi Guaçu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353080, 'Mogi Mirim', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353090, 'Mombuca', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353100, 'Monções', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353110, 'Mongaguá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353120, 'Monte Alegre do Sul', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353130, 'Monte Alto', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353140, 'Monte Aprazível', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353150, 'Monte Azul Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353160, 'Monte Castelo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353170, 'Monteiro Lobato', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353180, 'Monte Mor', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353190, 'Morro Agudo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353200, 'Morungaba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353205, 'Motuca', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353210, 'Murutinga do Sul', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353215, 'Nantes', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353220, 'Narandiba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353230, 'Natividade da Serra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353240, 'Nazaré Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353250, 'Neves Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353260, 'Nhandeara', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353270, 'Nipoã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353280, 'Nova Aliança', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353282, 'Nova Campina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353284, 'Nova Canaã Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353286, 'Nova Castilho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353290, 'Nova Europa', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353300, 'Nova Granada', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353310, 'Nova Guataporanga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353320, 'Nova Independência', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353325, 'Novais', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353330, 'Nova Luzitânia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353340, 'Nova Odessa', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353350, 'Novo Horizonte', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353360, 'Nuporanga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353370, 'Ocauçu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353380, 'Óleo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353390, 'Olímpia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353400, 'Onda Verde', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353410, 'Oriente', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353420, 'Orindiúva', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353430, 'Orlândia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353440, 'Osasco', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353450, 'Oscar Bressane', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353460, 'Osvaldo Cruz', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353470, 'Ourinhos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353475, 'Ouroeste', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353480, 'Ouro Verde', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353490, 'Pacaembu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353500, 'Palestina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353510, 'Palmares Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353520, 'Palmeira d''Oeste', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353530, 'Palmital', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353540, 'Panorama', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353550, 'Paraguaçu Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353560, 'Paraibuna', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353570, 'Paraíso', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353580, 'Paranapanema', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353590, 'Paranapuã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353600, 'Parapuã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353610, 'Pardinho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353620, 'Pariquera-Açu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353625, 'Parisi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353630, 'Patrocínio Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353640, 'Paulicéia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353650, 'Paulínia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353657, 'Paulistânia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353660, 'Paulo de Faria', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353670, 'Pederneiras', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353680, 'Pedra Bela', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353690, 'Pedranópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353700, 'Pedregulho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353710, 'Pedreira', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353715, 'Pedrinhas Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353720, 'Pedro de Toledo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353730, 'Penápolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353740, 'Pereira Barreto', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353750, 'Pereiras', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353760, 'Peruíbe', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353770, 'Piacatu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353780, 'Piedade', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353790, 'Pilar do Sul', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353800, 'Pindamonhangaba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353810, 'Pindorama', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353820, 'Pinhalzinho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353830, 'Piquerobi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353850, 'Piquete', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353860, 'Piracaia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353870, 'Piracicaba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353880, 'Piraju', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353890, 'Pirajuí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353900, 'Pirangi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353910, 'Pirapora do Bom Jesus', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353920, 'Pirapozinho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353930, 'Pirassununga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353940, 'Piratininga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353950, 'Pitangueiras', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353960, 'Planalto', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353970, 'Platina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353980, 'Poá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (353990, 'Poloni', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354000, 'Pompéia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354010, 'Pongaí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354020, 'Pontal', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354025, 'Pontalinda', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354030, 'Pontes Gestal', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354040, 'Populina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354050, 'Porangaba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354060, 'Porto Feliz', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354070, 'Porto Ferreira', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354075, 'Potim', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354080, 'Potirendaba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354085, 'Pracinha', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354090, 'Pradópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354100, 'Praia Grande', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354105, 'Pratânia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354110, 'Presidente Alves', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354120, 'Presidente Bernardes', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354130, 'Presidente Epitácio', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354140, 'Presidente Prudente', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354150, 'Presidente Venceslau', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354160, 'Promissão', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354165, 'Quadra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354170, 'Quatá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354180, 'Queiroz', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354190, 'Queluz', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354200, 'Quintana', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354210, 'Rafard', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354220, 'Rancharia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354230, 'Redenção da Serra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354240, 'Regente Feijó', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354250, 'Reginópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354260, 'Registro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354270, 'Restinga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354280, 'Ribeira', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354290, 'Ribeirão Bonito', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354300, 'Ribeirão Branco', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354310, 'Ribeirão Corrente', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354320, 'Ribeirão do Sul', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354323, 'Ribeirão dos Índios', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354325, 'Ribeirão Grande', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354330, 'Ribeirão Pires', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354340, 'Ribeirão Preto', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354350, 'Riversul', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354360, 'Rifaina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354370, 'Rincão', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354380, 'Rinópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354390, 'Rio Claro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354400, 'Rio das Pedras', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354410, 'Rio Grande da Serra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354420, 'Riolândia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354425, 'Rosana', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354430, 'Roseira', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354440, 'Rubiácea', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354450, 'Rubinéia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354460, 'Sabino', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354470, 'Sagres', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354480, 'Sales', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354490, 'Sales Oliveira', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354500, 'Salesópolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354510, 'Salmourão', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354515, 'Saltinho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354520, 'Salto', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354530, 'Salto de Pirapora', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354540, 'Salto Grande', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354550, 'Sandovalina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354560, 'Santa Adélia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354570, 'Santa Albertina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354580, 'Santa Bárbara D''Oeste', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354600, 'Santa Branca', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354610, 'Santa Clara d''Oeste', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354620, 'Santa Cruz da Conceição', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354625, 'Santa Cruz da Esperança', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354630, 'Santa Cruz das Palmeiras', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354640, 'Santa Cruz do Rio Pardo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354650, 'Santa Ernestina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354660, 'Santa Fé do Sul', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354670, 'Santa Gertrudes', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354680, 'Santa Isabel', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354690, 'Santa Lúcia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354700, 'Santa Maria da Serra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354710, 'Santa Mercedes', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354720, 'Santana da Ponte Pensa', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354730, 'Santana de Parnaíba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354740, 'Santa Rita d''Oeste', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354750, 'Santa Rita do Passa Quatro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354760, 'Santa Rosa de Viterbo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354765, 'Santa Salete', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354770, 'Santo Anastácio', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354780, 'Santo André', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354790, 'Santo Antônio da Alegria', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354800, 'Santo Antônio de Posse', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354805, 'Santo Antônio do Aracanguá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354810, 'Santo Antônio do Jardim', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354820, 'Santo Antônio do Pinhal', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354830, 'Santo Expedito', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354840, 'Santópolis do Aguapeí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354850, 'Santos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354860, 'São Bento do Sapucaí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354870, 'São Bernardo do Campo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354880, 'São Caetano do Sul', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354890, 'São Carlos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354900, 'São Francisco', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354910, 'São João da Boa Vista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354920, 'São João das Duas Pontes', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354925, 'São João de Iracema', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354930, 'São João do Pau d''Alho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354940, 'São Joaquim da Barra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354950, 'São José da Bela Vista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354960, 'São José do Barreiro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354970, 'São José do Rio Pardo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354980, 'São José do Rio Preto', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354990, 'São José dos Campos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (354995, 'São Lourenço da Serra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355000, 'São Luiz do Paraitinga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355010, 'São Manuel', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355020, 'São Miguel Arcanjo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355030, 'São Paulo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355040, 'São Pedro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355050, 'São Pedro do Turvo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355060, 'São Roque', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355070, 'São Sebastião', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355080, 'São Sebastião da Grama', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355090, 'São Simão', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355100, 'São Vicente', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355110, 'Sarapuí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355120, 'Sarutaiá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355130, 'Sebastianópolis do Sul', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355140, 'Serra Azul', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355150, 'Serrana', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355160, 'Serra Negra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355170, 'Sertãozinho', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355180, 'Sete Barras', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355190, 'Severínia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355200, 'Silveiras', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355210, 'Socorro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355220, 'Sorocaba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355230, 'Sud Mennucci', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355240, 'Sumaré', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355250, 'Suzano', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355255, 'Suzanápolis', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355260, 'Tabapuã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355270, 'Tabatinga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355280, 'Taboão da Serra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355290, 'Taciba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355300, 'Taguaí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355310, 'Taiaçu', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355320, 'Taiúva', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355330, 'Tambaú', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355340, 'Tanabi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355350, 'Tapiraí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355360, 'Tapiratiba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355365, 'Taquaral', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355370, 'Taquaritinga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355380, 'Taquarituba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355385, 'Taquarivaí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355390, 'Tarabai', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355395, 'Tarumã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355400, 'Tatuí', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355410, 'Taubaté', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355420, 'Tejupá', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355430, 'Teodoro Sampaio', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355440, 'Terra Roxa', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355450, 'Tietê', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355460, 'Timburi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355465, 'Torre de Pedra', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355470, 'Torrinha', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355475, 'Trabiju', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355480, 'Tremembé', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355490, 'Três Fronteiras', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355495, 'Tuiuti', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355500, 'Tupã', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355510, 'Tupi Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355520, 'Turiúba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355530, 'Turmalina', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355535, 'Ubarana', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355540, 'Ubatuba', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355550, 'Ubirajara', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355560, 'Uchoa', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355570, 'União Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355580, 'Urânia', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355590, 'Uru', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355600, 'Urupês', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355610, 'Valentim Gentil', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355620, 'Valinhos', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355630, 'Valparaíso', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355635, 'Vargem', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355640, 'Vargem Grande do Sul', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355645, 'Vargem Grande Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355650, 'Várzea Paulista', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355660, 'Vera Cruz', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355670, 'Vinhedo', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355680, 'Viradouro', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355690, 'Vista Alegre do Alto', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355695, 'Vitória Brasil', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355700, 'Votorantim', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355710, 'Votuporanga', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355715, 'Zacarias', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355720, 'Chavantes', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (355730, 'Estiva Gerbi', 35);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410010, 'Abatiá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410020, 'Adrianópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410030, 'Agudos do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410040, 'Almirante Tamandaré', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410045, 'Altamira do Paraná', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410050, 'Altônia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410060, 'Alto Paraná', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410070, 'Alto Piquiri', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410080, 'Alvorada do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410090, 'Amaporã', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410100, 'Ampére', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410105, 'Anahy', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410110, 'Andirá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410115, 'Ângulo', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410120, 'Antonina', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410130, 'Antônio Olinto', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410140, 'Apucarana', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410150, 'Arapongas', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410160, 'Arapoti', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410165, 'Arapuã', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410170, 'Araruna', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410180, 'Araucária', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410185, 'Ariranha do Ivaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410190, 'Assaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410200, 'Assis Chateaubriand', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410210, 'Astorga', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410220, 'Atalaia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410230, 'Balsa Nova', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410240, 'Bandeirantes', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410250, 'Barbosa Ferraz', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410260, 'Barracão', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410270, 'Barra do Jacaré', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410275, 'Bela Vista da Caroba', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410280, 'Bela Vista do Paraíso', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410290, 'Bituruna', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410300, 'Boa Esperança', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410302, 'Boa Esperança do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410304, 'Boa Ventura de São Roque', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410305, 'Boa Vista da Aparecida', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410310, 'Bocaiúva do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410315, 'Bom Jesus do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410320, 'Bom Sucesso', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410322, 'Bom Sucesso do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410330, 'Borrazópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410335, 'Braganey', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410337, 'Brasilândia do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410340, 'Cafeara', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410345, 'Cafelândia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410347, 'Cafezal do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410350, 'Califórnia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410360, 'Cambará', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410370, 'Cambé', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410380, 'Cambira', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410390, 'Campina da Lagoa', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410395, 'Campina do Simão', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410400, 'Campina Grande do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410405, 'Campo Bonito', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410410, 'Campo do Tenente', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410420, 'Campo Largo', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410425, 'Campo Magro', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410430, 'Campo Mourão', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410440, 'Cândido de Abreu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410442, 'Candói', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410445, 'Cantagalo', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410450, 'Capanema', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410460, 'Capitão Leônidas Marques', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410465, 'Carambeí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410470, 'Carlópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410480, 'Cascavel', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410490, 'Castro', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410500, 'Catanduvas', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410510, 'Centenário do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410520, 'Cerro Azul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410530, 'Céu Azul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410540, 'Chopinzinho', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410550, 'Cianorte', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410560, 'Cidade Gaúcha', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410570, 'Clevelândia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410580, 'Colombo', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410590, 'Colorado', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410600, 'Congonhinhas', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410610, 'Conselheiro Mairinck', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410620, 'Contenda', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410630, 'Corbélia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410640, 'Cornélio Procópio', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410645, 'Coronel Domingos Soares', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410650, 'Coronel Vivida', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410655, 'Corumbataí do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410657, 'Cruzeiro do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410660, 'Cruzeiro do Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410670, 'Cruzeiro do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410680, 'Cruz Machado', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410685, 'Cruzmaltina', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410690, 'Curitiba', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410700, 'Curiúva', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410710, 'Diamante do Norte', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410712, 'Diamante do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410715, 'Diamante D''Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410720, 'Dois Vizinhos', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410725, 'Douradina', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410730, 'Doutor Camargo', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410740, 'Enéas Marques', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410750, 'Engenheiro Beltrão', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410752, 'Esperança Nova', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410753, 'Entre Rios do Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410754, 'Espigão Alto do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410755, 'Farol', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410760, 'Faxinal', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410765, 'Fazenda Rio Grande', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410770, 'Fênix', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410773, 'Fernandes Pinheiro', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410775, 'Figueira', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410780, 'Floraí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410785, 'Flor da Serra do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410790, 'Floresta', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410800, 'Florestópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410810, 'Flórida', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410820, 'Formosa do Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410830, 'Foz do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410832, 'Francisco Alves', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410840, 'Francisco Beltrão', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410845, 'Foz do Jordão', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410850, 'General Carneiro', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410855, 'Godoy Moreira', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410860, 'Goioerê', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410865, 'Goioxim', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410870, 'Grandes Rios', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410880, 'Guaíra', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410890, 'Guairaçá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410895, 'Guamiranga', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410900, 'Guapirama', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410910, 'Guaporema', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410920, 'Guaraci', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410930, 'Guaraniaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410940, 'Guarapuava', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410950, 'Guaraqueçaba', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410960, 'Guaratuba', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410965, 'Honório Serpa', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410970, 'Ibaiti', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410975, 'Ibema', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410980, 'Ibiporã', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (410990, 'Icaraíma', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411000, 'Iguaraçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411005, 'Iguatu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411007, 'Imbaú', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411010, 'Imbituva', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411020, 'Inácio Martins', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411030, 'Inajá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411040, 'Indianópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411050, 'Ipiranga', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411060, 'Iporã', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411065, 'Iracema do Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411070, 'Irati', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411080, 'Iretama', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411090, 'Itaguajé', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411095, 'Itaipulândia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411100, 'Itambaracá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411110, 'Itambé', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411120, 'Itapejara d''Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411125, 'Itaperuçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411130, 'Itaúna do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411140, 'Ivaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411150, 'Ivaiporã', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411155, 'Ivaté', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411160, 'Ivatuba', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411170, 'Jaboti', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411180, 'Jacarezinho', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411190, 'Jaguapitã', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411200, 'Jaguariaíva', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411210, 'Jandaia do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411220, 'Janiópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411230, 'Japira', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411240, 'Japurá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411250, 'Jardim Alegre', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411260, 'Jardim Olinda', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411270, 'Jataizinho', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411275, 'Jesuítas', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411280, 'Joaquim Távora', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411290, 'Jundiaí do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411295, 'Juranda', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411300, 'Jussara', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411310, 'Kaloré', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411320, 'Lapa', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411325, 'Laranjal', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411330, 'Laranjeiras do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411340, 'Leópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411342, 'Lidianópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411345, 'Lindoeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411350, 'Loanda', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411360, 'Lobato', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411370, 'Londrina', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411373, 'Luiziana', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411375, 'Lunardelli', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411380, 'Lupionópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411390, 'Mallet', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411400, 'Mamborê', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411410, 'Mandaguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411420, 'Mandaguari', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411430, 'Mandirituba', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411435, 'Manfrinópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411440, 'Mangueirinha', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411450, 'Manoel Ribas', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411460, 'Marechal Cândido Rondon', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411470, 'Maria Helena', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411480, 'Marialva', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411490, 'Marilândia do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411500, 'Marilena', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411510, 'Mariluz', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411520, 'Maringá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411530, 'Mariópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411535, 'Maripá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411540, 'Marmeleiro', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411545, 'Marquinho', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411550, 'Marumbi', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411560, 'Matelândia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411570, 'Matinhos', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411573, 'Mato Rico', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411575, 'Mauá da Serra', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411580, 'Medianeira', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411585, 'Mercedes', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411590, 'Mirador', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411600, 'Miraselva', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411605, 'Missal', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411610, 'Moreira Sales', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411620, 'Morretes', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411630, 'Munhoz de Melo', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411640, 'Nossa Senhora das Graças', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411650, 'Nova Aliança do Ivaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411660, 'Nova América da Colina', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411670, 'Nova Aurora', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411680, 'Nova Cantu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411690, 'Nova Esperança', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411695, 'Nova Esperança do Sudoeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411700, 'Nova Fátima', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411705, 'Nova Laranjeiras', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411710, 'Nova Londrina', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411720, 'Nova Olímpia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411721, 'Nova Santa Bárbara', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411722, 'Nova Santa Rosa', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411725, 'Nova Prata do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411727, 'Nova Tebas', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411729, 'Novo Itacolomi', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411730, 'Ortigueira', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411740, 'Ourizona', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411745, 'Ouro Verde do Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411750, 'Paiçandu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411760, 'Palmas', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411770, 'Palmeira', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411780, 'Palmital', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411790, 'Palotina', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411800, 'Paraíso do Norte', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411810, 'Paranacity', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411820, 'Paranaguá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411830, 'Paranapoema', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411840, 'Paranavaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411845, 'Pato Bragado', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411850, 'Pato Branco', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411860, 'Paula Freitas', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411870, 'Paulo Frontin', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411880, 'Peabiru', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411885, 'Perobal', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411890, 'Pérola', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411900, 'Pérola d''Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411910, 'Piên', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411915, 'Pinhais', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411920, 'Pinhalão', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411925, 'Pinhal de São Bento', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411930, 'Pinhão', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411940, 'Piraí do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411950, 'Piraquara', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411960, 'Pitanga', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411965, 'Pitangueiras', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411970, 'Planaltina do Paraná', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411980, 'Planalto', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411990, 'Ponta Grossa', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (411995, 'Pontal do Paraná', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412000, 'Porecatu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412010, 'Porto Amazonas', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412015, 'Porto Barreiro', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412020, 'Porto Rico', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412030, 'Porto Vitória', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412033, 'Prado Ferreira', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412035, 'Pranchita', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412040, 'Presidente Castelo Branco', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412050, 'Primeiro de Maio', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412060, 'Prudentópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412065, 'Quarto Centenário', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412070, 'Quatiguá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412080, 'Quatro Barras', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412085, 'Quatro Pontes', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412090, 'Quedas do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412100, 'Querência do Norte', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412110, 'Quinta do Sol', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412120, 'Quitandinha', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412125, 'Ramilândia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412130, 'Rancho Alegre', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412135, 'Rancho Alegre D''Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412140, 'Realeza', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412150, 'Rebouças', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412160, 'Renascença', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412170, 'Reserva', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412175, 'Reserva do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412180, 'Ribeirão Claro', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412190, 'Ribeirão do Pinhal', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412200, 'Rio Azul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412210, 'Rio Bom', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412215, 'Rio Bonito do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412217, 'Rio Branco do Ivaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412220, 'Rio Branco do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412230, 'Rio Negro', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412240, 'Rolândia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412250, 'Roncador', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412260, 'Rondon', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412265, 'Rosário do Ivaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412270, 'Sabáudia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412280, 'Salgado Filho', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412290, 'Salto do Itararé', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412300, 'Salto do Lontra', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412310, 'Santa Amélia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412320, 'Santa Cecília do Pavão', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412330, 'Santa Cruz de Monte Castelo', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412340, 'Santa Fé', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412350, 'Santa Helena', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412360, 'Santa Inês', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412370, 'Santa Isabel do Ivaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412380, 'Santa Izabel do Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412382, 'Santa Lúcia', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412385, 'Santa Maria do Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412390, 'Santa Mariana', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412395, 'Santa Mônica', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412400, 'Santana do Itararé', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412402, 'Santa Tereza do Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412405, 'Santa Terezinha de Itaipu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412410, 'Santo Antônio da Platina', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412420, 'Santo Antônio do Caiuá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412430, 'Santo Antônio do Paraíso', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412440, 'Santo Antônio do Sudoeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412450, 'Santo Inácio', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412460, 'São Carlos do Ivaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412470, 'São Jerônimo da Serra', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412480, 'São João', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412490, 'São João do Caiuá', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412500, 'São João do Ivaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412510, 'São João do Triunfo', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412520, 'São Jorge d''Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412530, 'São Jorge do Ivaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412535, 'São Jorge do Patrocínio', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412540, 'São José da Boa Vista', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412545, 'São José das Palmeiras', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412550, 'São José dos Pinhais', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412555, 'São Manoel do Paraná', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412560, 'São Mateus do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412570, 'São Miguel do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412575, 'São Pedro do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412580, 'São Pedro do Ivaí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412590, 'São Pedro do Paraná', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412600, 'São Sebastião da Amoreira', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412610, 'São Tomé', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412620, 'Sapopema', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412625, 'Sarandi', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412627, 'Saudade do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412630, 'Sengés', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412635, 'Serranópolis do Iguaçu', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412640, 'Sertaneja', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412650, 'Sertanópolis', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412660, 'Siqueira Campos', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412665, 'Sulina', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412667, 'Tamarana', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412670, 'Tamboara', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412680, 'Tapejara', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412690, 'Tapira', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412700, 'Teixeira Soares', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412710, 'Telêmaco Borba', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412720, 'Terra Boa', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412730, 'Terra Rica', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412740, 'Terra Roxa', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412750, 'Tibagi', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412760, 'Tijucas do Sul', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412770, 'Toledo', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412780, 'Tomazina', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412785, 'Três Barras do Paraná', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412788, 'Tunas do Paraná', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412790, 'Tuneiras do Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412795, 'Tupãssi', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412796, 'Turvo', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412800, 'Ubiratã', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412810, 'Umuarama', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412820, 'União da Vitória', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412830, 'Uniflor', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412840, 'Uraí', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412850, 'Wenceslau Braz', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412853, 'Ventania', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412855, 'Vera Cruz do Oeste', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412860, 'Verê', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412862, 'Alto Paraíso', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412863, 'Doutor Ulysses', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412865, 'Virmond', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412870, 'Vitorino', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (412880, 'Xambrê', 41);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420005, 'Abdon Batista', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420010, 'Abelardo Luz', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420020, 'Agrolândia', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420030, 'Agronômica', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420040, 'Água Doce', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420050, 'Águas de Chapecó', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420055, 'Águas Frias', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420060, 'Águas Mornas', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420070, 'Alfredo Wagner', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420075, 'Alto Bela Vista', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420080, 'Anchieta', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420090, 'Angelina', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420100, 'Anita Garibaldi', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420110, 'Anitápolis', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420120, 'Antônio Carlos', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420125, 'Apiúna', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420127, 'Arabutã', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420130, 'Araquari', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420140, 'Araranguá', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420150, 'Armazém', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420160, 'Arroio Trinta', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420165, 'Arvoredo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420170, 'Ascurra', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420180, 'Atalanta', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420190, 'Aurora', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420195, 'Balneário Arroio do Silva', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420200, 'Balneário Camboriú', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420205, 'Balneário Barra do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420207, 'Balneário Gaivota', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420208, 'Bandeirante', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420209, 'Barra Bonita', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420210, 'Barra Velha', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420213, 'Bela Vista do Toldo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420215, 'Belmonte', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420220, 'Benedito Novo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420230, 'Biguaçu', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420240, 'Blumenau', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420243, 'Bocaina do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420245, 'Bombinhas', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420250, 'Bom Jardim da Serra', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420253, 'Bom Jesus', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420257, 'Bom Jesus do Oeste', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420260, 'Bom Retiro', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420270, 'Botuverá', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420280, 'Braço do Norte', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420285, 'Braço do Trombudo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420287, 'Brunópolis', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420290, 'Brusque', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420300, 'Caçador', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420310, 'Caibi', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420315, 'Calmon', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420320, 'Camboriú', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420325, 'Capão Alto', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420330, 'Campo Alegre', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420340, 'Campo Belo do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420350, 'Campo Erê', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420360, 'Campos Novos', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420370, 'Canelinha', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420380, 'Canoinhas', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420390, 'Capinzal', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420395, 'Capivari de Baixo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420400, 'Catanduvas', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420410, 'Caxambu do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420415, 'Celso Ramos', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420417, 'Cerro Negro', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420419, 'Chapadão do Lageado', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420420, 'Chapecó', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420425, 'Cocal do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420430, 'Concórdia', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420435, 'Cordilheira Alta', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420440, 'Coronel Freitas', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420445, 'Coronel Martins', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420450, 'Corupá', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420455, 'Correia Pinto', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420460, 'Criciúma', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420470, 'Cunha Porã', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420475, 'Cunhataí', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420480, 'Curitibanos', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420490, 'Descanso', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420500, 'Dionísio Cerqueira', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420510, 'Dona Emma', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420515, 'Doutor Pedrinho', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420517, 'Entre Rios', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420519, 'Ermo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420520, 'Erval Velho', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420530, 'Faxinal dos Guedes', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420535, 'Flor do Sertão', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420540, 'Florianópolis', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420543, 'Formosa do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420545, 'Forquilhinha', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420550, 'Fraiburgo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420555, 'Frei Rogério', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420560, 'Galvão', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420570, 'Garopaba', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420580, 'Garuva', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420590, 'Gaspar', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420600, 'Governador Celso Ramos', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420610, 'Grão Pará', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420620, 'Gravatal', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420630, 'Guabiruba', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420640, 'Guaraciaba', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420650, 'Guaramirim', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420660, 'Guarujá do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420665, 'Guatambú', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420670, 'Herval d''Oeste', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420675, 'Ibiam', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420680, 'Ibicaré', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420690, 'Ibirama', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420700, 'Içara', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420710, 'Ilhota', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420720, 'Imaruí', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420730, 'Imbituba', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420740, 'Imbuia', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420750, 'Indaial', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420757, 'Iomerê', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420760, 'Ipira', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420765, 'Iporã do Oeste', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420768, 'Ipuaçu', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420770, 'Ipumirim', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420775, 'Iraceminha', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420780, 'Irani', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420785, 'Irati', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420790, 'Irineópolis', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420800, 'Itá', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420810, 'Itaiópolis', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420820, 'Itajaí', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420830, 'Itapema', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420840, 'Itapiranga', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420845, 'Itapoá', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420850, 'Ituporanga', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420860, 'Jaborá', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420870, 'Jacinto Machado', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420880, 'Jaguaruna', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420890, 'Jaraguá do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420895, 'Jardinópolis', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420900, 'Joaçaba', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420910, 'Joinville', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420915, 'José Boiteux', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420917, 'Jupiá', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420920, 'Lacerdópolis', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420930, 'Lages', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420940, 'Laguna', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420945, 'Lajeado Grande', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420950, 'Laurentino', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420960, 'Lauro Muller', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420970, 'Lebon Régis', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420980, 'Leoberto Leal', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420985, 'Lindóia do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (420990, 'Lontras', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421000, 'Luiz Alves', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421003, 'Luzerna', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421005, 'Macieira', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421010, 'Mafra', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421020, 'Major Gercino', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421030, 'Major Vieira', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421040, 'Maracajá', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421050, 'Maravilha', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421055, 'Marema', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421060, 'Massaranduba', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421070, 'Matos Costa', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421080, 'Meleiro', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421085, 'Mirim Doce', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421090, 'Modelo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421100, 'Mondaí', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421105, 'Monte Carlo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421110, 'Monte Castelo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421120, 'Morro da Fumaça', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421125, 'Morro Grande', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421130, 'Navegantes', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421140, 'Nova Erechim', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421145, 'Nova Itaberaba', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421150, 'Nova Trento', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421160, 'Nova Veneza', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421165, 'Novo Horizonte', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421170, 'Orleans', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421175, 'Otacílio Costa', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421180, 'Ouro', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421185, 'Ouro Verde', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421187, 'Paial', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421189, 'Painel', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421190, 'Palhoça', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421200, 'Palma Sola', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421205, 'Palmeira', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421210, 'Palmitos', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421220, 'Papanduva', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421223, 'Paraíso', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421225, 'Passo de Torres', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421227, 'Passos Maia', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421230, 'Paulo Lopes', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421240, 'Pedras Grandes', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421250, 'Penha', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421260, 'Peritiba', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421270, 'Petrolândia', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421280, 'Balneário Piçarras', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421290, 'Pinhalzinho', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421300, 'Pinheiro Preto', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421310, 'Piratuba', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421315, 'Planalto Alegre', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421320, 'Pomerode', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421330, 'Ponte Alta', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421335, 'Ponte Alta do Norte', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421340, 'Ponte Serrada', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421350, 'Porto Belo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421360, 'Porto União', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421370, 'Pouso Redondo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421380, 'Praia Grande', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421390, 'Presidente Castello Branco', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421400, 'Presidente Getúlio', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421410, 'Presidente Nereu', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421415, 'Princesa', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421420, 'Quilombo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421430, 'Rancho Queimado', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421440, 'Rio das Antas', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421450, 'Rio do Campo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421460, 'Rio do Oeste', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421470, 'Rio dos Cedros', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421480, 'Rio do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421490, 'Rio Fortuna', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421500, 'Rio Negrinho', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421505, 'Rio Rufino', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421507, 'Riqueza', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421510, 'Rodeio', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421520, 'Romelândia', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421530, 'Salete', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421535, 'Saltinho', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421540, 'Salto Veloso', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421545, 'Sangão', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421550, 'Santa Cecília', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421555, 'Santa Helena', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421560, 'Santa Rosa de Lima', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421565, 'Santa Rosa do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421567, 'Santa Terezinha', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421568, 'Santa Terezinha do Progresso', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421569, 'Santiago do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421570, 'Santo Amaro da Imperatriz', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421575, 'São Bernardino', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421580, 'São Bento do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421590, 'São Bonifácio', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421600, 'São Carlos', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421605, 'São Cristovão do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421610, 'São Domingos', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421620, 'São Francisco do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421625, 'São João do Oeste', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421630, 'São João Batista', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421635, 'São João do Itaperiú', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421640, 'São João do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421650, 'São Joaquim', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421660, 'São José', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421670, 'São José do Cedro', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421680, 'São José do Cerrito', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421690, 'São Lourenço do Oeste', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421700, 'São Ludgero', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421710, 'São Martinho', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421715, 'São Miguel da Boa Vista', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421720, 'São Miguel do Oeste', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421725, 'São Pedro de Alcântara', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421730, 'Saudades', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421740, 'Schroeder', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421750, 'Seara', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421755, 'Serra Alta', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421760, 'Siderópolis', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421770, 'Sombrio', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421775, 'Sul Brasil', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421780, 'Taió', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421790, 'Tangará', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421795, 'Tigrinhos', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421800, 'Tijucas', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421810, 'Timbé do Sul', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421820, 'Timbó', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421825, 'Timbó Grande', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421830, 'Três Barras', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421835, 'Treviso', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421840, 'Treze de Maio', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421850, 'Treze Tílias', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421860, 'Trombudo Central', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421870, 'Tubarão', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421875, 'Tunápolis', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421880, 'Turvo', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421885, 'União do Oeste', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421890, 'Urubici', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421895, 'Urupema', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421900, 'Urussanga', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421910, 'Vargeão', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421915, 'Vargem', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421917, 'Vargem Bonita', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421920, 'Vidal Ramos', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421930, 'Videira', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421935, 'Vitor Meireles', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421940, 'Witmarsum', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421950, 'Xanxerê', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421960, 'Xavantina', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421970, 'Xaxim', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (421985, 'Zortéa', 42);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430003, 'Aceguá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430005, 'Água Santa', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430010, 'Agudo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430020, 'Ajuricaba', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430030, 'Alecrim', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430040, 'Alegrete', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430045, 'Alegria', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430047, 'Almirante Tamandaré do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430050, 'Alpestre', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430055, 'Alto Alegre', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430057, 'Alto Feliz', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430060, 'Alvorada', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430063, 'Amaral Ferrador', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430064, 'Ametista do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430066, 'André da Rocha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430070, 'Anta Gorda', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430080, 'Antônio Prado', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430085, 'Arambaré', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430087, 'Araricá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430090, 'Aratiba', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430100, 'Arroio do Meio', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430105, 'Arroio do Sal', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430107, 'Arroio do Padre', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430110, 'Arroio dos Ratos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430120, 'Arroio do Tigre', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430130, 'Arroio Grande', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430140, 'Arvorezinha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430150, 'Augusto Pestana', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430155, 'Áurea', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430160, 'Bagé', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430163, 'Balneário Pinhal', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430165, 'Barão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430170, 'Barão de Cotegipe', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430175, 'Barão do Triunfo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430180, 'Barracão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430185, 'Barra do Guarita', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430187, 'Barra do Quaraí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430190, 'Barra do Ribeiro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430192, 'Barra do Rio Azul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430195, 'Barra Funda', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430200, 'Barros Cassal', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430205, 'Benjamin Constant do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430210, 'Bento Gonçalves', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430215, 'Boa Vista das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430220, 'Boa Vista do Buricá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430222, 'Boa Vista do Cadeado', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430223, 'Boa Vista do Incra', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430225, 'Boa Vista do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430230, 'Bom Jesus', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430235, 'Bom Princípio', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430237, 'Bom Progresso', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430240, 'Bom Retiro do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430245, 'Boqueirão do Leão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430250, 'Bossoroca', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430258, 'Bozano', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430260, 'Braga', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430265, 'Brochier', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430270, 'Butiá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430280, 'Caçapava do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430290, 'Cacequi', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430300, 'Cachoeira do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430310, 'Cachoeirinha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430320, 'Cacique Doble', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430330, 'Caibaté', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430340, 'Caiçara', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430350, 'Camaquã', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430355, 'Camargo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430360, 'Cambará do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430367, 'Campestre da Serra', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430370, 'Campina das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430380, 'Campinas do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430390, 'Campo Bom', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430400, 'Campo Novo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430410, 'Campos Borges', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430420, 'Candelária', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430430, 'Cândido Godói', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430435, 'Candiota', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430440, 'Canela', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430450, 'Canguçu', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430460, 'Canoas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430461, 'Canudos do Vale', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430462, 'Capão Bonito do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430463, 'Capão da Canoa', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430465, 'Capão do Cipó', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430466, 'Capão do Leão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430467, 'Capivari do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430468, 'Capela de Santana', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430469, 'Capitão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430470, 'Carazinho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430471, 'Caraá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430480, 'Carlos Barbosa', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430485, 'Carlos Gomes', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430490, 'Casca', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430495, 'Caseiros', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430500, 'Catuípe', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430510, 'Caxias do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430511, 'Centenário', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430512, 'Cerrito', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430513, 'Cerro Branco', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430515, 'Cerro Grande', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430517, 'Cerro Grande do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430520, 'Cerro Largo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430530, 'Chapada', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430535, 'Charqueadas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430537, 'Charrua', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430540, 'Chiapetta', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430543, 'Chuí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430544, 'Chuvisca', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430545, 'Cidreira', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430550, 'Ciríaco', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430558, 'Colinas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430560, 'Colorado', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430570, 'Condor', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430580, 'Constantina', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430583, 'Coqueiro Baixo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430585, 'Coqueiros do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430587, 'Coronel Barros', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430590, 'Coronel Bicaco', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430593, 'Coronel Pilar', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430595, 'Cotiporã', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430597, 'Coxilha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430600, 'Crissiumal', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430605, 'Cristal', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430607, 'Cristal do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430610, 'Cruz Alta', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430613, 'Cruzaltense', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430620, 'Cruzeiro do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430630, 'David Canabarro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430632, 'Derrubadas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430635, 'Dezesseis de Novembro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430637, 'Dilermando de Aguiar', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430640, 'Dois Irmãos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430642, 'Dois Irmãos das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430645, 'Dois Lajeados', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430650, 'Dom Feliciano', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430655, 'Dom Pedro de Alcântara', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430660, 'Dom Pedrito', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430670, 'Dona Francisca', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430673, 'Doutor Maurício Cardoso', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430675, 'Doutor Ricardo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430676, 'Eldorado do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430680, 'Encantado', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430690, 'Encruzilhada do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430692, 'Engenho Velho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430693, 'Entre-Ijuís', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430695, 'Entre Rios do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430697, 'Erebango', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430700, 'Erechim', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430705, 'Ernestina', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430710, 'Herval', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430720, 'Erval Grande', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430730, 'Erval Seco', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430740, 'Esmeralda', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430745, 'Esperança do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430750, 'Espumoso', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430755, 'Estação', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430760, 'Estância Velha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430770, 'Esteio', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430780, 'Estrela', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430781, 'Estrela Velha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430783, 'Eugênio de Castro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430786, 'Fagundes Varela', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430790, 'Farroupilha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430800, 'Faxinal do Soturno', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430805, 'Faxinalzinho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430807, 'Fazenda Vilanova', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430810, 'Feliz', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430820, 'Flores da Cunha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430825, 'Floriano Peixoto', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430830, 'Fontoura Xavier', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430840, 'Formigueiro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430843, 'Forquetinha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430845, 'Fortaleza dos Valos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430850, 'Frederico Westphalen', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430860, 'Garibaldi', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430865, 'Garruchos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430870, 'Gaurama', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430880, 'General Câmara', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430885, 'Gentil', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430890, 'Getúlio Vargas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430900, 'Giruá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430905, 'Glorinha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430910, 'Gramado', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430912, 'Gramado dos Loureiros', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430915, 'Gramado Xavier', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430920, 'Gravataí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430925, 'Guabiju', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430930, 'Guaíba', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430940, 'Guaporé', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430950, 'Guarani das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430955, 'Harmonia', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430957, 'Herveiras', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430960, 'Horizontina', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430965, 'Hulha Negra', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430970, 'Humaitá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430975, 'Ibarama', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430980, 'Ibiaçá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430990, 'Ibiraiaras', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (430995, 'Ibirapuitã', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431000, 'Ibirubá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431010, 'Igrejinha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431020, 'Ijuí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431030, 'Ilópolis', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431033, 'Imbé', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431036, 'Imigrante', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431040, 'Independência', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431041, 'Inhacorá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431043, 'Ipê', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431046, 'Ipiranga do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431050, 'Iraí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431053, 'Itaara', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431055, 'Itacurubi', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431057, 'Itapuca', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431060, 'Itaqui', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431065, 'Itati', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431070, 'Itatiba do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431075, 'Ivorá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431080, 'Ivoti', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431085, 'Jaboticaba', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431087, 'Jacuizinho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431090, 'Jacutinga', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431100, 'Jaguarão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431110, 'Jaguari', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431112, 'Jaquirana', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431113, 'Jari', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431115, 'Jóia', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431120, 'Júlio de Castilhos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431123, 'Lagoa Bonita do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431125, 'Lagoão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431127, 'Lagoa dos Três Cantos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431130, 'Lagoa Vermelha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431140, 'Lajeado', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431142, 'Lajeado do Bugre', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431150, 'Lavras do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431160, 'Liberato Salzano', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431162, 'Lindolfo Collor', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431164, 'Linha Nova', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431170, 'Machadinho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431171, 'Maçambará', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431173, 'Mampituba', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431175, 'Manoel Viana', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431177, 'Maquiné', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431179, 'Maratá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431180, 'Marau', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431190, 'Marcelino Ramos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431198, 'Mariana Pimentel', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431200, 'Mariano Moro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431205, 'Marques de Souza', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431210, 'Mata', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431213, 'Mato Castelhano', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431215, 'Mato Leitão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431217, 'Mato Queimado', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431220, 'Maximiliano de Almeida', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431225, 'Minas do Leão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431230, 'Miraguaí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431235, 'Montauri', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431237, 'Monte Alegre dos Campos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431238, 'Monte Belo do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431240, 'Montenegro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431242, 'Mormaço', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431244, 'Morrinhos do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431245, 'Morro Redondo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431247, 'Morro Reuter', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431250, 'Mostardas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431260, 'Muçum', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431261, 'Muitos Capões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431262, 'Muliterno', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431265, 'Não-Me-Toque', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431267, 'Nicolau Vergueiro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431270, 'Nonoai', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431275, 'Nova Alvorada', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431280, 'Nova Araçá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431290, 'Nova Bassano', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431295, 'Nova Boa Vista', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431300, 'Nova Bréscia', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431301, 'Nova Candelária', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431303, 'Nova Esperança do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431306, 'Nova Hartz', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431308, 'Nova Pádua', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431310, 'Nova Palma', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431320, 'Nova Petrópolis', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431330, 'Nova Prata', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431333, 'Nova Ramada', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431335, 'Nova Roma do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431337, 'Nova Santa Rita', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431339, 'Novo Cabrais', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431340, 'Novo Hamburgo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431342, 'Novo Machado', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431344, 'Novo Tiradentes', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431346, 'Novo Xingu', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431349, 'Novo Barreiro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431350, 'Osório', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431360, 'Paim Filho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431365, 'Palmares do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431370, 'Palmeira das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431380, 'Palmitinho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431390, 'Panambi', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431395, 'Pantano Grande', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431400, 'Paraí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431402, 'Paraíso do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431403, 'Pareci Novo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431405, 'Parobé', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431406, 'Passa Sete', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431407, 'Passo do Sobrado', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431410, 'Passo Fundo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431413, 'Paulo Bento', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431415, 'Paverama', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431417, 'Pedras Altas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431420, 'Pedro Osório', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431430, 'Pejuçara', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431440, 'Pelotas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431442, 'Picada Café', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431445, 'Pinhal', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431446, 'Pinhal da Serra', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431447, 'Pinhal Grande', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431449, 'Pinheirinho do Vale', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431450, 'Pinheiro Machado', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431455, 'Pirapó', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431460, 'Piratini', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431470, 'Planalto', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431475, 'Poço das Antas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431477, 'Pontão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431478, 'Ponte Preta', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431480, 'Portão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431490, 'Porto Alegre', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431500, 'Porto Lucena', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431505, 'Porto Mauá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431507, 'Porto Vera Cruz', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431510, 'Porto Xavier', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431513, 'Pouso Novo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431514, 'Presidente Lucena', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431515, 'Progresso', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431517, 'Protásio Alves', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431520, 'Putinga', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431530, 'Quaraí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431531, 'Quatro Irmãos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431532, 'Quevedos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431535, 'Quinze de Novembro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431540, 'Redentora', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431545, 'Relvado', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431550, 'Restinga Seca', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431555, 'Rio dos Índios', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431560, 'Rio Grande', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431570, 'Rio Pardo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431575, 'Riozinho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431580, 'Roca Sales', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431590, 'Rodeio Bonito', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431595, 'Rolador', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431600, 'Rolante', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431610, 'Ronda Alta', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431620, 'Rondinha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431630, 'Roque Gonzales', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431640, 'Rosário do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431642, 'Sagrada Família', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431643, 'Saldanha Marinho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431645, 'Salto do Jacuí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431647, 'Salvador das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431650, 'Salvador do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431660, 'Sananduva', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431670, 'Santa Bárbara do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431673, 'Santa Cecília do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431675, 'Santa Clara do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431680, 'Santa Cruz do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431690, 'Santa Maria', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431695, 'Santa Maria do Herval', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431697, 'Santa Margarida do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431700, 'Santana da Boa Vista', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431710, 'Santana do Livramento', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431720, 'Santa Rosa', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431725, 'Santa Tereza', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431730, 'Santa Vitória do Palmar', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431740, 'Santiago', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431750, 'Santo Ângelo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431755, 'Santo Antônio do Palma', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431760, 'Santo Antônio da Patrulha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431770, 'Santo Antônio das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431775, 'Santo Antônio do Planalto', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431780, 'Santo Augusto', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431790, 'Santo Cristo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431795, 'Santo Expedito do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431800, 'São Borja', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431805, 'São Domingos do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431810, 'São Francisco de Assis', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431820, 'São Francisco de Paula', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431830, 'São Gabriel', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431840, 'São Jerônimo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431842, 'São João da Urtiga', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431843, 'São João do Polêsine', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431844, 'São Jorge', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431845, 'São José das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431846, 'São José do Herval', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431848, 'São José do Hortêncio', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431849, 'São José do Inhacorá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431850, 'São José do Norte', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431860, 'São José do Ouro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431861, 'São José do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431862, 'São José dos Ausentes', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431870, 'São Leopoldo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431880, 'São Lourenço do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431890, 'São Luiz Gonzaga', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431900, 'São Marcos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431910, 'São Martinho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431912, 'São Martinho da Serra', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431915, 'São Miguel das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431920, 'São Nicolau', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431930, 'São Paulo das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431935, 'São Pedro da Serra', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431936, 'São Pedro das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431937, 'São Pedro do Butiá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431940, 'São Pedro do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431950, 'São Sebastião do Caí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431960, 'São Sepé', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431970, 'São Valentim', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431971, 'São Valentim do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431973, 'São Valério do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431975, 'São Vendelino', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431980, 'São Vicente do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (431990, 'Sapiranga', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432000, 'Sapucaia do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432010, 'Sarandi', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432020, 'Seberi', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432023, 'Sede Nova', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432026, 'Segredo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432030, 'Selbach', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432032, 'Senador Salgado Filho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432035, 'Sentinela do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432040, 'Serafina Corrêa', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432045, 'Sério', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432050, 'Sertão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432055, 'Sertão Santana', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432057, 'Sete de Setembro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432060, 'Severiano de Almeida', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432065, 'Silveira Martins', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432067, 'Sinimbu', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432070, 'Sobradinho', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432080, 'Soledade', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432085, 'Tabaí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432090, 'Tapejara', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432100, 'Tapera', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432110, 'Tapes', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432120, 'Taquara', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432130, 'Taquari', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432132, 'Taquaruçu do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432135, 'Tavares', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432140, 'Tenente Portela', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432143, 'Terra de Areia', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432145, 'Teutônia', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432146, 'Tio Hugo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432147, 'Tiradentes do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432149, 'Toropi', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432150, 'Torres', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432160, 'Tramandaí', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432162, 'Travesseiro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432163, 'Três Arroios', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432166, 'Três Cachoeiras', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432170, 'Três Coroas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432180, 'Três de Maio', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432183, 'Três Forquilhas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432185, 'Três Palmeiras', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432190, 'Três Passos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432195, 'Trindade do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432200, 'Triunfo', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432210, 'Tucunduva', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432215, 'Tunas', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432218, 'Tupanci do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432220, 'Tupanciretã', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432225, 'Tupandi', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432230, 'Tuparendi', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432232, 'Turuçu', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432234, 'Ubiretama', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432235, 'União da Serra', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432237, 'Unistalda', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432240, 'Uruguaiana', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432250, 'Vacaria', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432252, 'Vale Verde', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432253, 'Vale do Sol', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432254, 'Vale Real', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432255, 'Vanini', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432260, 'Venâncio Aires', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432270, 'Vera Cruz', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432280, 'Veranópolis', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432285, 'Vespasiano Correa', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432290, 'Viadutos', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432300, 'Viamão', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432310, 'Vicente Dutra', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432320, 'Victor Graeff', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432330, 'Vila Flores', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432335, 'Vila Lângaro', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432340, 'Vila Maria', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432345, 'Vila Nova do Sul', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432350, 'Vista Alegre', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432360, 'Vista Alegre do Prata', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432370, 'Vista Gaúcha', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432375, 'Vitória das Missões', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432377, 'Westfalia', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (432380, 'Xangri-lá', 43);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500020, 'Água Clara', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500025, 'Alcinópolis', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500060, 'Amambai', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500070, 'Anastácio', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500080, 'Anaurilândia', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500085, 'Angélica', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500090, 'Antônio João', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500100, 'Aparecida do Taboado', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500110, 'Aquidauana', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500124, 'Aral Moreira', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500150, 'Bandeirantes', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500190, 'Bataguassu', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500200, 'Batayporã', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500210, 'Bela Vista', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500215, 'Bodoquena', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500220, 'Bonito', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500230, 'Brasilândia', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500240, 'Caarapó', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500260, 'Camapuã', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500270, 'Campo Grande', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500280, 'Caracol', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500290, 'Cassilândia', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500295, 'Chapadão do Sul', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500310, 'Corguinho', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500315, 'Coronel Sapucaia', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500320, 'Corumbá', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500325, 'Costa Rica', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500330, 'Coxim', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500345, 'Deodápolis', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500348, 'Dois Irmãos do Buriti', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500350, 'Douradina', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500370, 'Dourados', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500375, 'Eldorado', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500380, 'Fátima do Sul', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500390, 'Figueirão', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500400, 'Glória de Dourados', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500410, 'Guia Lopes da Laguna', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500430, 'Iguatemi', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500440, 'Inocência', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500450, 'Itaporã', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500460, 'Itaquiraí', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500470, 'Ivinhema', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500480, 'Japorã', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500490, 'Jaraguari', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500500, 'Jardim', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500510, 'Jateí', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500515, 'Juti', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500520, 'Ladário', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500525, 'Laguna Carapã', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500540, 'Maracaju', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500560, 'Miranda', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500568, 'Mundo Novo', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500570, 'Naviraí', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500580, 'Nioaque', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500600, 'Nova Alvorada do Sul', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500620, 'Nova Andradina', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500625, 'Novo Horizonte do Sul', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500630, 'Paranaíba', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500635, 'Paranhos', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500640, 'Pedro Gomes', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500660, 'Ponta Porã', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500690, 'Porto Murtinho', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500710, 'Ribas do Rio Pardo', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500720, 'Rio Brilhante', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500730, 'Rio Negro', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500740, 'Rio Verde de Mato Grosso', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500750, 'Rochedo', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500755, 'Santa Rita do Pardo', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500769, 'São Gabriel do Oeste', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500770, 'Sete Quedas', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500780, 'Selvíria', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500790, 'Sidrolândia', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500793, 'Sonora', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500795, 'Tacuru', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500797, 'Taquarussu', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500800, 'Terenos', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500830, 'Três Lagoas', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (500840, 'Vicentina', 50);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510010, 'Acorizal', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510020, 'Água Boa', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510025, 'Alta Floresta', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510030, 'Alto Araguaia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510035, 'Alto Boa Vista', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510040, 'Alto Garças', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510050, 'Alto Paraguai', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510060, 'Alto Taquari', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510080, 'Apiacás', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510100, 'Araguaiana', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510120, 'Araguainha', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510125, 'Araputanga', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510130, 'Arenápolis', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510140, 'Aripuanã', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510160, 'Barão de Melgaço', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510170, 'Barra do Bugres', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510180, 'Barra do Garças', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510185, 'Bom Jesus do Araguaia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510190, 'Brasnorte', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510250, 'Cáceres', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510260, 'Campinápolis', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510263, 'Campo Novo do Parecis', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510267, 'Campo Verde', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510268, 'Campos de Júlio', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510269, 'Canabrava do Norte', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510270, 'Canarana', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510279, 'Carlinda', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510285, 'Castanheira', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510300, 'Chapada dos Guimarães', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510305, 'Cláudia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510310, 'Cocalinho', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510320, 'Colíder', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510325, 'Colniza', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510330, 'Comodoro', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510335, 'Confresa', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510336, 'Conquista D''Oeste', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510337, 'Cotriguaçu', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510340, 'Cuiabá', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510343, 'Curvelândia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510345, 'Denise', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510350, 'Diamantino', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510360, 'Dom Aquino', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510370, 'Feliz Natal', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510380, 'Figueirópolis D''Oeste', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510385, 'Gaúcha do Norte', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510390, 'General Carneiro', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510395, 'Glória D''Oeste', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510410, 'Guarantã do Norte', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510420, 'Guiratinga', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510450, 'Indiavaí', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510452, 'Ipiranga do Norte', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510454, 'Itanhangá', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510455, 'Itaúba', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510460, 'Itiquira', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510480, 'Jaciara', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510490, 'Jangada', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510500, 'Jauru', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510510, 'Juara', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510515, 'Juína', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510517, 'Juruena', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510520, 'Juscimeira', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510523, 'Lambari D''Oeste', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510525, 'Lucas do Rio Verde', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510530, 'Luciara', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510550, 'Vila Bela da Santíssima Trindade', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510558, 'Marcelândia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510560, 'Matupá', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510562, 'Mirassol d''Oeste', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510590, 'Nobres', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510600, 'Nortelândia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510610, 'Nossa Senhora do Livramento', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510615, 'Nova Bandeirantes', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510617, 'Nova Nazaré', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510618, 'Nova Lacerda', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510619, 'Nova Santa Helena', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510620, 'Nova Brasilândia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510621, 'Nova Canaã do Norte', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510622, 'Nova Mutum', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510623, 'Nova Olímpia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510624, 'Nova Ubiratã', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510625, 'Nova Xavantina', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510626, 'Novo Mundo', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510627, 'Novo Horizonte do Norte', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510628, 'Novo São Joaquim', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510629, 'Paranaíta', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510630, 'Paranatinga', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510631, 'Novo Santo Antônio', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510637, 'Pedra Preta', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510642, 'Peixoto de Azevedo', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510645, 'Planalto da Serra', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510650, 'Poconé', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510665, 'Pontal do Araguaia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510670, 'Ponte Branca', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510675, 'Pontes e Lacerda', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510677, 'Porto Alegre do Norte', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510680, 'Porto dos Gaúchos', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510682, 'Porto Esperidião', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510685, 'Porto Estrela', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510700, 'Poxoréo', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510704, 'Primavera do Leste', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510706, 'Querência', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510710, 'São José dos Quatro Marcos', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510715, 'Reserva do Cabaçal', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510718, 'Ribeirão Cascalheira', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510719, 'Ribeirãozinho', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510720, 'Rio Branco', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510724, 'Santa Carmem', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510726, 'Santo Afonso', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510729, 'São José do Povo', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510730, 'São José do Rio Claro', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510735, 'São José do Xingu', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510740, 'São Pedro da Cipa', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510757, 'Rondolândia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510760, 'Rondonópolis', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510770, 'Rosário Oeste', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510774, 'Santa Cruz do Xingu', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510775, 'Salto do Céu', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510776, 'Santa Rita do Trivelato', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510777, 'Santa Terezinha', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510779, 'Santo Antônio do Leste', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510780, 'Santo Antônio do Leverger', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510785, 'São Félix do Araguaia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510787, 'Sapezal', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510788, 'Serra Nova Dourada', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510790, 'Sinop', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510792, 'Sorriso', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510794, 'Tabaporã', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510795, 'Tangará da Serra', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510800, 'Tapurah', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510805, 'Terra Nova do Norte', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510810, 'Tesouro', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510820, 'Torixoréu', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510830, 'União do Sul', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510835, 'Vale de São Domingos', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510840, 'Várzea Grande', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510850, 'Vera', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510860, 'Vila Rica', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510880, 'Nova Guarita', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510885, 'Nova Marilândia', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510890, 'Nova Maringá', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (510895, 'Nova Monte Verde', 51);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520005, 'Abadia de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520010, 'Abadiânia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520013, 'Acreúna', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520015, 'Adelândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520017, 'Água Fria de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520020, 'Água Limpa', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520025, 'Águas Lindas de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520030, 'Alexânia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520050, 'Aloândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520055, 'Alto Horizonte', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520060, 'Alto Paraíso de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520080, 'Alvorada do Norte', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520082, 'Amaralina', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520085, 'Americano do Brasil', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520090, 'Amorinópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520110, 'Anápolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520120, 'Anhanguera', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520130, 'Anicuns', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520140, 'Aparecida de Goiânia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520145, 'Aparecida do Rio Doce', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520150, 'Aporé', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520160, 'Araçu', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520170, 'Aragarças', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520180, 'Aragoiânia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520215, 'Araguapaz', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520235, 'Arenópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520250, 'Aruanã', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520260, 'Aurilândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520280, 'Avelinópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520310, 'Baliza', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520320, 'Barro Alto', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520330, 'Bela Vista de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520340, 'Bom Jardim de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520350, 'Bom Jesus de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520355, 'Bonfinópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520357, 'Bonópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520360, 'Brazabrantes', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520380, 'Britânia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520390, 'Buriti Alegre', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520393, 'Buriti de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520396, 'Buritinópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520400, 'Cabeceiras', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520410, 'Cachoeira Alta', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520420, 'Cachoeira de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520425, 'Cachoeira Dourada', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520430, 'Caçu', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520440, 'Caiapônia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520450, 'Caldas Novas', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520455, 'Caldazinha', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520460, 'Campestre de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520465, 'Campinaçu', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520470, 'Campinorte', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520480, 'Campo Alegre de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520485, 'Campo Limpo de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520490, 'Campos Belos', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520495, 'Campos Verdes', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520500, 'Carmo do Rio Verde', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520505, 'Castelândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520510, 'Catalão', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520520, 'Caturaí', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520530, 'Cavalcante', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520540, 'Ceres', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520545, 'Cezarina', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520547, 'Chapadão do Céu', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520549, 'Cidade Ocidental', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520551, 'Cocalzinho de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520552, 'Colinas do Sul', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520570, 'Córrego do Ouro', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520580, 'Corumbá de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520590, 'Corumbaíba', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520620, 'Cristalina', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520630, 'Cristianópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520640, 'Crixás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520650, 'Cromínia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520660, 'Cumari', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520670, 'Damianópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520680, 'Damolândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520690, 'Davinópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520710, 'Diorama', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520725, 'Doverlândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520735, 'Edealina', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520740, 'Edéia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520750, 'Estrela do Norte', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520753, 'Faina', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520760, 'Fazenda Nova', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520780, 'Firminópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520790, 'Flores de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520800, 'Formosa', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520810, 'Formoso', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520815, 'Gameleira de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520830, 'Divinópolis de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520840, 'Goianápolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520850, 'Goiandira', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520860, 'Goianésia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520870, 'Goiânia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520880, 'Goianira', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520890, 'Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520910, 'Goiatuba', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520915, 'Gouvelândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520920, 'Guapó', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520929, 'Guaraíta', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520940, 'Guarani de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520945, 'Guarinos', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520960, 'Heitoraí', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520970, 'Hidrolândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520980, 'Hidrolina', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520990, 'Iaciara', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520993, 'Inaciolândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (520995, 'Indiara', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521000, 'Inhumas', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521010, 'Ipameri', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521015, 'Ipiranga de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521020, 'Iporá', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521030, 'Israelândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521040, 'Itaberaí', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521056, 'Itaguari', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521060, 'Itaguaru', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521080, 'Itajá', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521090, 'Itapaci', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521100, 'Itapirapuã', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521120, 'Itapuranga', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521130, 'Itarumã', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521140, 'Itauçu', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521150, 'Itumbiara', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521160, 'Ivolândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521170, 'Jandaia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521180, 'Jaraguá', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521190, 'Jataí', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521200, 'Jaupaci', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521205, 'Jesúpolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521210, 'Joviânia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521220, 'Jussara', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521225, 'Lagoa Santa', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521230, 'Leopoldo de Bulhões', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521250, 'Luziânia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521260, 'Mairipotaba', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521270, 'Mambaí', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521280, 'Mara Rosa', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521290, 'Marzagão', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521295, 'Matrinchã', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521300, 'Maurilândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521305, 'Mimoso de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521308, 'Minaçu', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521310, 'Mineiros', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521340, 'Moiporá', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521350, 'Monte Alegre de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521370, 'Montes Claros de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521375, 'Montividiu', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521377, 'Montividiu do Norte', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521380, 'Morrinhos', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521385, 'Morro Agudo de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521390, 'Mossâmedes', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521400, 'Mozarlândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521405, 'Mundo Novo', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521410, 'Mutunópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521440, 'Nazário', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521450, 'Nerópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521460, 'Niquelândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521470, 'Nova América', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521480, 'Nova Aurora', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521483, 'Nova Crixás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521486, 'Nova Glória', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521487, 'Nova Iguaçu de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521490, 'Nova Roma', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521500, 'Nova Veneza', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521520, 'Novo Brasil', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521523, 'Novo Gama', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521525, 'Novo Planalto', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521530, 'Orizona', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521540, 'Ouro Verde de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521550, 'Ouvidor', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521560, 'Padre Bernardo', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521565, 'Palestina de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521570, 'Palmeiras de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521580, 'Palmelo', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521590, 'Palminópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521600, 'Panamá', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521630, 'Paranaiguara', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521640, 'Paraúna', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521645, 'Perolândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521680, 'Petrolina de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521690, 'Pilar de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521710, 'Piracanjuba', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521720, 'Piranhas', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521730, 'Pirenópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521740, 'Pires do Rio', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521760, 'Planaltina', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521770, 'Pontalina', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521800, 'Porangatu', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521805, 'Porteirão', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521810, 'Portelândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521830, 'Posse', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521839, 'Professor Jamil', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521850, 'Quirinópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521860, 'Rialma', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521870, 'Rianápolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521878, 'Rio Quente', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521880, 'Rio Verde', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521890, 'Rubiataba', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521900, 'Sanclerlândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521910, 'Santa Bárbara de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521920, 'Santa Cruz de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521925, 'Santa Fé de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521930, 'Santa Helena de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521935, 'Santa Isabel', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521940, 'Santa Rita do Araguaia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521945, 'Santa Rita do Novo Destino', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521950, 'Santa Rosa de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521960, 'Santa Tereza de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521970, 'Santa Terezinha de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521971, 'Santo Antônio da Barra', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521973, 'Santo Antônio de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521975, 'Santo Antônio do Descoberto', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521980, 'São Domingos', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (521990, 'São Francisco de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522000, 'São João d''Aliança', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522005, 'São João da Paraúna', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522010, 'São Luís de Montes Belos', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522015, 'São Luíz do Norte', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522020, 'São Miguel do Araguaia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522026, 'São Miguel do Passa Quatro', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522028, 'São Patrício', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522040, 'São Simão', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522045, 'Senador Canedo', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522050, 'Serranópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522060, 'Silvânia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522068, 'Simolândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522070, 'Sítio d''Abadia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522100, 'Taquaral de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522108, 'Teresina de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522119, 'Terezópolis de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522130, 'Três Ranchos', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522140, 'Trindade', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522145, 'Trombas', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522150, 'Turvânia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522155, 'Turvelândia', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522157, 'Uirapuru', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522160, 'Uruaçu', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522170, 'Uruana', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522180, 'Urutaí', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522185, 'Valparaíso de Goiás', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522190, 'Varjão', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522200, 'Vianópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522205, 'Vicentinópolis', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522220, 'Vila Boa', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (522230, 'Vila Propício', 52);
INSERT INTO tb_municipio(co_municipio, no_municipio, co_uf)
VALUES (530010, 'Brasília', 53);

-- Carga critérios
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (1, 'abrangencia_nacional', 'Abrangência nacional', '2 macrorregiões', 1, 2);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (2, 'abrangencia_nacional', 'Abrangência nacional', '3 macrorregiões', 2, 2);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (3, 'abrangencia_nacional', 'Abrangência nacional', '4 macrorregiões', 3, 2);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (4, 'abrangencia_nacional', 'Abrangência nacional', '5 macrorregiões', 4, 2);


INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (5, 'abrangencia_estadual', 'Abrangência estadual', 'De 5 a 10 estados', 1, 2);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (6, 'abrangencia_estadual', 'Abrangência estadual', 'De 11 a 18 estados', 2, 2);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (7, 'abrangencia_estadual', 'Abrangência estadual', 'De 19 a 27 estados', 3, 2);

INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (8, 'tempo_funcionamento', 'Tempo de funcionamento', 'De 3 a 5 anos', 1, 1);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (9, 'tempo_funcionamento', 'Tempo de funcionamento', 'De 6 a 10 anos', 2, 1);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (10, 'tempo_funcionamento', 'Tempo de funcionamento', 'De 11 a 15 anos', 3, 1);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (11, 'tempo_funcionamento', 'Tempo de funcionamento', 'Acima de 15 anos', 4, 1);

INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (12, 'nu_associados_filiados', 'Número de associados ou filiados', 'Até 100', 1, 1);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (13, 'nu_associados_filiados', 'Número de associados ou filiados', 'De 101 a 500', 2, 1);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (14, 'nu_associados_filiados', 'Número de associados ou filiados', 'De 501 a 1000', 3, 1);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (15, 'nu_associados_filiados', 'Número de associados ou filiados', 'Acima de 1000', 4, 1);

INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (16, 'nu_atividades', 'Número de atividades ou projetos realizados no campo cultural a partide 2016', 'De 1 a 4',
        1, 2);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (17, 'nu_atividades', 'Número de atividades ou projetos realizados no campo cultural a partide 2016', 'De 5 a 9',
        2, 2);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (18, 'nu_atividades', 'Número de atividades ou projetos realizados no campo cultural a partide 2016',
        'De 10 a 14', 3, 2);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (19, 'nu_atividades', 'Número de atividades ou projetos realizados no campo cultural a partide 2016', 'Acima 14',
        4, 2);

INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (20, 'participacao_instancias',
        'Participação em instâncias colegiadas de formulação de política cultural (conselhos, comissões, câmaras)',
        'Municipal', 1, 1);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (21, 'participacao_instancias',
        'Participação em instâncias colegiadas de formulação de política cultural (conselhos, comissões, câmaras)',
        'Estadual', 2, 1);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (22, 'participacao_instancias',
        'Participação em instâncias colegiadas de formulação de política cultural (conselhos, comissões, câmaras)',
        'Nacional', 3, 1);

INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (23, 'pesquisa_producao',
        'Projetos na área de pesquisa ou produção do conhecimento no campo da cultura a partir de 2016', 'De 1 a 5', 1,
        1);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (24, 'pesquisa_producao',
        'Projetos na área de pesquisa ou produção do conhecimento no campo da cultura a partir de 2016', 'De 6 a 10', 2,
        1);
INSERT INTO tb_criterio(co_criterio, tp_criterio, ds_criterio, ds_detalhamento, qt_pontuacao, qt_peso)
VALUES (25, 'pesquisa_producao',
        'Projetos na área de pesquisa ou produção do conhecimento no campo da cultura a partir de 2016', 'Acima de 10',
        3, 1);

-- Carga segmentos
INSERT INTO tb_segmento(co_segmento, tp_segmento, ds_detalhamento, st_ativo)
VALUES (1, 'tecnico_artistico', 'Técnico-artístico', TRUE);
INSERT INTO tb_segmento(co_segmento, tp_segmento, ds_detalhamento, st_ativo)
VALUES (2, 'patrimonio_cultural', 'Patrimônio cultural', TRUE);
INSERT INTO tb_segmento(co_segmento, tp_segmento, ds_detalhamento, st_ativo)
VALUES (3, 'culturas_populares', 'Culturas populares', TRUE);
INSERT INTO tb_segmento(co_segmento, tp_segmento, ds_detalhamento, st_ativo)
VALUES (4, 'culturas_povos_indigenas', 'Culturas dos povos indígenas', TRUE);
INSERT INTO tb_segmento(co_segmento, tp_segmento, ds_detalhamento, st_ativo)
VALUES (5, 'expressoes_afrobrasileiras', 'Expressões culturais afro-brasileiras', TRUE);

-- Carga fase
INSERT INTO tb_fase (co_fase, tp_fase, dh_inicio, dh_fim)
VALUES (1, 'abertura_inscricoes_conselho', '2019-08-13 10:00:00.000000', '2019-08-30 00:00:00.000000');
INSERT INTO tb_fase (co_fase, tp_fase, dh_inicio, dh_fim)
VALUES (2, 'abertura_inscricoes_organizacao', '2019-08-13 10:00:00.000000', '2019-08-30 00:00:00.000000');
INSERT INTO tb_fase (co_fase, tp_fase, dh_inicio, dh_fim)
VALUES (3, 'abertura_inscricoes_eleitor', '2019-09-15 00:00:01.000000', '2019-09-15 00:00:02.000000');

-- Carga perfil
INSERT INTO public.tb_perfil (co_perfil, no_perfil, ds_perfil, st_ativo)
VALUES (1, 'avaliador', 'Avaliador', true);
INSERT INTO public.tb_perfil (co_perfil, no_perfil, ds_perfil, st_ativo)
VALUES (2, 'eleitor', 'Eleitor', true);
INSERT INTO public.tb_perfil (co_perfil, no_perfil, ds_perfil, st_ativo)
VALUES (3, 'conselho', 'Conselho', true);
INSERT INTO public.tb_perfil (co_perfil, no_perfil, ds_perfil, st_ativo)
VALUES (4, 'organizacao', 'Organização', true);
INSERT INTO public.tb_perfil (co_perfil, no_perfil, ds_perfil, st_ativo)
VALUES (777, 'administrador', 'Administrador', true);

-- Carga Regiões
ALTER TABLE tb_uf
    ADD co_regiao int NULL;

UPDATE tb_uf
SET co_regiao = 1
WHERE co_ibge = 12;
UPDATE tb_uf
SET co_regiao = 2
WHERE co_ibge = 27;
UPDATE tb_uf
SET co_regiao = 1
WHERE co_ibge = 16;
UPDATE tb_uf
SET co_regiao = 1
WHERE co_ibge = 13;
UPDATE tb_uf
SET co_regiao = 2
WHERE co_ibge = 29;
UPDATE tb_uf
SET co_regiao = 2
WHERE co_ibge = 23;
UPDATE tb_uf
SET co_regiao = 5
WHERE co_ibge = 53;
UPDATE tb_uf
SET co_regiao = 3
WHERE co_ibge = 32;
UPDATE tb_uf
SET co_regiao = 5
WHERE co_ibge = 52;
UPDATE tb_uf
SET co_regiao = 2
WHERE co_ibge = 21;
UPDATE tb_uf
SET co_regiao = 5
WHERE co_ibge = 51;
UPDATE tb_uf
SET co_regiao = 5
WHERE co_ibge = 50;
UPDATE tb_uf
SET co_regiao = 3
WHERE co_ibge = 31;
UPDATE tb_uf
SET co_regiao = 1
WHERE co_ibge = 15;
UPDATE tb_uf
SET co_regiao = 2
WHERE co_ibge = 25;
UPDATE tb_uf
SET co_regiao = 4
WHERE co_ibge = 41;
UPDATE tb_uf
SET co_regiao = 2
WHERE co_ibge = 26;
UPDATE tb_uf
SET co_regiao = 2
WHERE co_ibge = 22;
UPDATE tb_uf
SET co_regiao = 3
WHERE co_ibge = 33;
UPDATE tb_uf
SET co_regiao = 2
WHERE co_ibge = 24;
UPDATE tb_uf
SET co_regiao = 4
WHERE co_ibge = 43;
UPDATE tb_uf
SET co_regiao = 1
WHERE co_ibge = 11;
UPDATE tb_uf
SET co_regiao = 1
WHERE co_ibge = 14;
UPDATE tb_uf
SET co_regiao = 4
WHERE co_ibge = 42;
UPDATE tb_uf
SET co_regiao = 3
WHERE co_ibge = 35;
UPDATE tb_uf
SET co_regiao = 2
WHERE co_ibge = 28;
UPDATE tb_uf
SET co_regiao = 1
WHERE co_ibge = 17;

ALTER TABLE tb_uf
    ALTER COLUMN co_regiao SET NOT NULL;

CREATE TABLE tb_regiao
(
    co_regiao INT          NOT NULL,
    no_regiao VARCHAR(100) NOT NULL,
    CONSTRAINT pk_regiao_coregiao PRIMARY KEY (co_regiao)
);

INSERT INTO tb_regiao (co_regiao, no_regiao)
VALUES (1, 'Norte');
INSERT INTO tb_regiao (co_regiao, no_regiao)
VALUES (2, 'Nordeste');
INSERT INTO tb_regiao (co_regiao, no_regiao)
VALUES (3, 'Sudeste');
INSERT INTO tb_regiao (co_regiao, no_regiao)
VALUES (4, 'Sul');
INSERT INTO tb_regiao (co_regiao, no_regiao)
VALUES (5, 'Centro-Oeste');

ALTER TABLE public.tb_uf
    ADD CONSTRAINT tb_uf_tb_regiao_co_regiao_fk
        FOREIGN KEY (co_regiao) REFERENCES public.tb_regiao (co_regiao);

-- [ Executar abaixo : 10/09/2019] <-------------------------

ALTER TABLE tb_eleitor
    ADD dh_cadastro timestamp DEFAULT current_timestamp NULL;
ALTER TABLE tb_conselho
    ADD dh_cadastro timestamp DEFAULT current_timestamp NULL;
ALTER TABLE tb_organizacao
    ADD dh_cadastro timestamp DEFAULT current_timestamp NULL;
ALTER TABLE tb_representante
    ADD dh_cadastro timestamp DEFAULT current_timestamp NULL;
ALTER TABLE tb_usuario
    ALTER COLUMN dh_cadastro TYPE timestamp USING dh_cadastro::timestamp;
ALTER TABLE tb_usuario
    ALTER COLUMN dh_cadastro SET DEFAULT current_timestamp;
ALTER TABLE tb_usuario
    ALTER COLUMN dh_ultima_atualizacao TYPE timestamp USING dh_ultima_atualizacao::timestamp;
ALTER TABLE tb_usuario
    ALTER COLUMN dh_ultima_atualizacao SET DEFAULT current_timestamp;
ALTER TABLE tb_representante
    rename column no_pessoa to no_nome;
ALTER TABLE tb_usuario
    ALTER COLUMN ds_codigo_ativacao DROP NOT NULL;
ALTER TABLE tb_eleitor
    ALTER COLUMN nu_rg TYPE varchar(11) USING nu_rg::varchar(11);
ALTER TABLE tb_usuario
    ADD CONSTRAINT fk_usuario_perfil_coperfil
        FOREIGN KEY (co_perfil) REFERENCES tb_perfil (co_perfil);

ALTER TABLE tb_cronograma
    rename TO tb_fase;
ALTER TABLE tb_fase
    rename COLUMN co_cronograma TO co_fase;
ALTER TABLE tb_fase
    rename COLUMN tp_cronograma TO tp_fase;
ALTER TABLE tb_fase
    ADD ds_detalhamento varchar(255) NULL;

---- Recurso Inscrição
create table tb_recurso_inscricao
(
    co_recurso_inscricao serial                              not null
        constraint tb_recurso_inscricao_pk
            primary key,
    co_fase              int                                 not null
        constraint tb_recurso_inscricao_fase_cofasefk
            references tb_fase (co_fase),
    ds_email             varchar(100)                        not null,
    nu_cnpj              varchar(14)                         not null,
    nu_cpf               varchar(11)                         not null,
    nu_telefone          varchar(11)                         not null,
    ds_recurso           text                                not null,
    dh_cadastro          timestamp default current_timestamp not null,
    co_usuario_parecer   int
        constraint tb_recurso_inscricao_tb_usuario_co_usuario_fk
            references tb_usuario,
    ds_parecer           text,
    dh_parecer           timestamp,
    st_parecer           char(1)
);

comment on table tb_recurso_inscricao is 'Armazena recursos de inscricoes';

comment on column tb_recurso_inscricao.st_parecer is ' 0 - Recusado | 1 - Aceito';


INSERT INTO tb_fase (co_fase, tp_fase, dh_inicio, dh_fim)
VALUES (3, 'abertura_inscricoes_eleitor', '2019-09-15 00:00:01.000000', '2019-09-15 00:00:02.000000');
UPDATE tb_fase
SET tp_fase         = 'abertura_inscricoes_conselho',
    dh_inicio       = '2019-08-13 10:00:00.000000',
    dh_fim          = '2019-08-30 00:00:00.000000',
    ds_detalhamento = 'Inscrições - Conselho'
WHERE co_fase = 1;
UPDATE tb_fase
SET tp_fase         = 'abertura_inscricoes_organizacao',
    dh_inicio       = '2019-08-13 10:00:00.000000',
    dh_fim          = '2019-08-30 00:00:00.000000',
    ds_detalhamento = 'Inscrições - Organização'
WHERE co_fase = 2;
UPDATE tb_fase
SET tp_fase         = 'abertura_inscricoes_eleitor',
    dh_inicio       = '2019-09-15 00:00:01.000000',
    dh_fim          = '2019-09-15 00:00:02.000000',
    ds_detalhamento = 'Inscrições - Eleitor'
WHERE co_fase = 3;
INSERT INTO tb_fase (co_fase, tp_fase, dh_inicio, dh_fim, ds_detalhamento)
VALUES (4, 'recurso_inscricoes_conselho', '2019-09-13 00:00:01.000000', '2019-09-08 17:18:21.000000',
        'Recurso - Inscrição Conselho');
INSERT INTO tb_fase (co_fase, tp_fase, dh_inicio, dh_fim, ds_detalhamento)
VALUES (5, 'recurso_inscricoes_organizacao', '2019-09-13 00:00:01.000000', '2019-09-08 17:18:21.000000',
        'Recurso - Inscrição Organização');

ALTER TABLE public.tb_recurso_inscricao
    ADD no_razao_social varchar(255) NULL;
COMMENT ON COLUMN public.tb_recurso_inscricao.no_razao_social IS 'Razão social da organização ou conselho';

ALTER TABLE public.tb_recurso_inscricao
    ADD no_representante varchar(255) NULL;
COMMENT ON COLUMN public.tb_recurso_inscricao.no_representante IS 'Nome do representando da organização ou conselho';


UPDATE tb_fase
SET dh_inicio = '2019-08-13 10:00:00.000000',
    dh_fim    = '2019-09-16 18:00:00.000000'
WHERE co_fase = 1;
UPDATE tb_fase
SET dh_inicio = '2019-08-13 10:00:00.000000',
    dh_fim    = '2019-09-16 18:00:00.000000'
WHERE co_fase = 2;
UPDATE tb_fase
SET tp_fase         = 'abertura_inscricoes_eleitor',
    dh_inicio       = '2019-09-16 18:00:01.000000',
    dh_fim          = '2019-11-25 18:00:02.000000',
    ds_detalhamento = 'Inscrições - Eleitor'
WHERE co_fase = 3;


UPDATE tb_fase
SET dh_inicio = '2019-09-17 00:09:01.000000',
    dh_fim    = '2019-09-18 18:00:00.000000'
WHERE co_fase = 4;
UPDATE tb_fase
SET dh_inicio = '2019-09-17 00:09:01.000000',
    dh_fim    = '2019-09-18 18:00:00.000000'
WHERE co_fase = 5;

ALTER TABLE public.tb_usuario
    ADD nu_cpf varchar(11) NULL;

-- Sprint 4

CREATE TABLE public.tb_representante_arquivo_avaliacao
(
    co_representante_arquivo_avaliacao serial PRIMARY KEY NOT NULL,
    co_representante_arquivo           int                NOT NULL,
    st_em_conformidade                 char(1)            NOT NULL,
    ds_observacao                      text,
    co_usuario_avaliador               int                NOT NULL,
    dh_avaliacao                       timestamp DEFAULT current_timestamp,
    CONSTRAINT tb_representante_arquivo_avaliacao_rl_representante_arquivo_co_representante_arquivo_fk FOREIGN KEY (co_representante_arquivo) REFERENCES public.rl_representante_arquivo (co_representante_arquivo),
    CONSTRAINT tb_representante_arquivo_avaliacao_tb_usuario_co_usuario_fk FOREIGN KEY (co_usuario_avaliador) REFERENCES public.tb_usuario (co_usuario)
);
COMMENT ON COLUMN public.tb_representante_arquivo_avaliacao.st_em_conformidade IS '0 - Não conforme | 1 - Conforme';

CREATE TABLE public.tb_conselho_habilitacao
(
    co_conselho_habilitacao serial PRIMARY KEY NOT NULL,
    co_conselho             int                NOT NULL,
    st_avaliacao            char(1)            NOT NULL,
    ds_parecer              text,
    CONSTRAINT tb_conselho_habilitacao_tb_conselho_co_conselho_fk FOREIGN KEY (co_conselho) REFERENCES public.tb_conselho (co_conselho)
);
COMMENT ON COLUMN public.tb_conselho_habilitacao.st_avaliacao IS '0 - Habilitado | 1 - Inabilitado';

ALTER TABLE public.tb_habilitacao_conselho
    RENAME TO tb_conselho_habilitacao;
ALTER TABLE public.tb_representante_arquivo_avaliacao
    ADD co_conselho_habilitacao int NOT NULL;
ALTER TABLE public.tb_conselho_habilitacao
    RENAME COLUMN co_habilitacao_conselho TO co_conselho_habilitacao;

ALTER TABLE public.tb_representante_arquivo_avaliacao
    ADD CONSTRAINT tb_repr_arq_av_cons_hab_co_conselho_hab_fk
        FOREIGN KEY (co_conselho_habilitacao) REFERENCES public.tb_conselho_habilitacao (co_conselho_habilitacao);

ALTER TABLE public.tb_conselho_habilitacao
    ADD dh_avaliacao timestamp DEFAULT current_timestamp NOT NULL;

CREATE TABLE public.tb_organizacao_habilitacao
(
    co_organizacao_habilitacao serial PRIMARY KEY NOT NULL,
    co_organizacao             int                NOT NULL,
    st_avaliacao               char(1)            NOT NULL,
    ds_parecer                 text,
    CONSTRAINT tb_org_hab_tb_org_co_org_fk FOREIGN KEY (co_organizacao) REFERENCES public.tb_organizacao (co_organizacao)
);
COMMENT ON COLUMN public.tb_organizacao_habilitacao.st_avaliacao IS '0 - Habilitado | 1 - Inabilitado';

ALTER TABLE public.tb_representante_arquivo_avaliacao
    ADD co_organizacao_habilitacao int NULL;

ALTER TABLE public.tb_representante_arquivo_avaliacao
    ADD CONSTRAINT tb_repr_arq_av_cons_hab_co_organizacao_hab_fk
        FOREIGN KEY (co_organizacao_habilitacao) REFERENCES public.tb_organizacao_habilitacao (co_organizacao_habilitacao);

ALTER TABLE public.tb_organizacao_habilitacao
    ADD dh_avaliacao timestamp DEFAULT current_timestamp NOT NULL;

ALTER TABLE public.tb_organizacao_habilitacao
    ADD nu_nova_pontuacao int NULL;

--###### Criando a tabela tb_conselho_habilitacao_recurso, vinculada à HU060 ######

CREATE TABLE public.tb_conselho_habilitacao_recurso
(
    co_conselho_habilitacao_recurso serial    NOT NULL,               -- Chave Primária da tabela
    co_conselho                     int4      NOT NULL,               -- Código do conselho a qual o usuário está solicitando recurso
    ds_recurso                      text      NOT NULL,               -- Descrição do recurso.
    co_arquivo                      int4      NULL,                   -- Referência ao arquivo anexado
    dh_cadastro_recurso             timestamp NOT NULL DEFAULT now(), -- Data de cadastro do recurso.
    CONSTRAINT ph_conselho_habilitacao_recurso PRIMARY KEY (co_conselho_habilitacao_recurso),
    CONSTRAINT fk_arquivo_conselho_habilitacao_recurso FOREIGN KEY (co_arquivo) REFERENCES tb_arquivo (co_arquivo),
    CONSTRAINT fk_conselho_conselho_habilitacao_recurso FOREIGN KEY (co_conselho) REFERENCES tb_conselho (co_conselho)
);
CREATE UNIQUE INDEX tb_conselho_habilitacao_recurso_co_conselho_habilitacao_recurso ON public.tb_conselho_habilitacao_recurso USING btree (co_conselho_habilitacao_recurso);

-- Column comments

COMMENT ON COLUMN public.tb_conselho_habilitacao_recurso.co_conselho_habilitacao_recurso IS 'Chave Primária da tabela';
COMMENT ON COLUMN public.tb_conselho_habilitacao_recurso.co_conselho IS 'Código do conselho a qual o usuário está solicitando recurso';
COMMENT ON COLUMN public.tb_conselho_habilitacao_recurso.ds_recurso IS 'Descrição do recurso.';
COMMENT ON COLUMN public.tb_conselho_habilitacao_recurso.co_arquivo IS 'Referência ao arquivo anexado';
COMMENT ON COLUMN public.tb_conselho_habilitacao_recurso.dh_cadastro_recurso IS 'Data de cadastro do recurso.';

-- Permissions

ALTER TABLE public.tb_conselho_habilitacao_recurso
    OWNER TO votacultura;
GRANT ALL ON TABLE public.tb_conselho_habilitacao_recurso TO votacultura;

ALTER TABLE public.tb_representante_arquivo_avaliacao
    ALTER COLUMN co_conselho_habilitacao DROP NOT NULL;

ALTER TABLE public.tb_conselho_habilitacao_recurso
    DROP COLUMN co_arquivo;

-- Drop table

-- DROP TABLE public.tb_conselho_indicacao;

CREATE TABLE public.tb_conselho_indicacao
(
    co_conselho_indicacao  serial        NOT NULL,
    nu_cpf_indicado        varchar(11)   NOT NULL,               -- Número do CPF do indicado.
    no_indicado            text          NOT NULL,               -- Nome do indicado.
    co_endereco            int4          NOT NULL,               -- Código referente ao endereço do indicado.
    co_conselho            int4          NOT NULL,               -- Código do conselho.
    dh_indicacao           timestamp     NOT NULL DEFAULT now(), -- Data da indicação.
    ds_curriculo           varchar(1000) NULL,                   -- Currículo do indicado pelo conselho.
    co_arquivo             int4          NULL,                   -- Código do arquivo da foto do indicado, referente à tabela tb_arquivo
    dt_nascimento_indicado date          NOT NULL,               -- Data de nascimento do indicado
    CONSTRAINT pk_conselho_indicacao PRIMARY KEY (co_conselho_indicacao),
    CONSTRAINT uk_conselho_indicacao UNIQUE (nu_cpf_indicado, co_conselho),
    CONSTRAINT fk_conselho_indicacao_arquivo FOREIGN KEY (co_arquivo) REFERENCES tb_arquivo (co_arquivo),
    CONSTRAINT fk_conselho_indicacao_endereco FOREIGN KEY (co_endereco) REFERENCES tb_endereco (co_endereco)
);

-- Column comments

COMMENT ON COLUMN public.tb_conselho_indicacao.nu_cpf_indicado IS 'Número do CPF do indicado.';
COMMENT ON COLUMN public.tb_conselho_indicacao.no_indicado IS 'Nome do indicado.';
COMMENT ON COLUMN public.tb_conselho_indicacao.co_endereco IS 'Código referente ao endereço do indicado.';
COMMENT ON COLUMN public.tb_conselho_indicacao.co_conselho IS 'Código do conselho.';
COMMENT ON COLUMN public.tb_conselho_indicacao.dh_indicacao IS 'Data da indicação.';
COMMENT ON COLUMN public.tb_conselho_indicacao.ds_curriculo IS 'Currículo do indicado pelo conselho.';
COMMENT ON COLUMN public.tb_conselho_indicacao.co_arquivo IS 'Código do arquivo da foto do indicado, referente à tabela tb_arquivo';
COMMENT ON COLUMN public.tb_conselho_indicacao.dt_nascimento_indicado IS 'Data de nascimento do indicado';

-- Permissions

ALTER TABLE public.tb_conselho_indicacao
    OWNER TO votacultura;
GRANT ALL ON TABLE public.tb_conselho_indicacao TO votacultura;

ALTER TABLE public.tb_endereco
    ALTER COLUMN nu_cep DROP NOT NULL;
ALTER TABLE public.tb_endereco
    ALTER COLUMN ds_logradouro DROP NOT NULL;

--#############
ALTER TABLE public.tb_conselho
    RENAME COLUMN st_inscricao TO st_indicacao;
ALTER TABLE public.tb_conselho
    ALTER COLUMN st_indicacao SET DEFAULT 'a';
COMMENT ON COLUMN public.tb_conselho.st_indicacao IS 'situação em que se encontra o período de indicados do conselho. Possíveis opções: a = aberto, f = fechado';

--#############

-- Drop table

-- DROP TABLE public.rl_conselho_indicacao_arquivo;

CREATE TABLE public.rl_conselho_indicacao_arquivo
(
    co_conselho_indicacao_arquivo serial       NOT NULL, -- chave primária da tabela
    co_conselho_indicacao         int4         NOT NULL, -- chave estrangeira referente a tabela tb_conselho_indicacao
    co_arquivo                    int4         NOT NULL, -- chave estrangeira referente a tabela tb_arquivo
    tp_arquivo                    varchar(255) NOT NULL, -- tipo do arquivo com slug do módulo.
    CONSTRAINT pk_conselho_indicacao_arquivo PRIMARY KEY (co_conselho_indicacao_arquivo),
    CONSTRAINT fk_conselho_indicacao_arquivo_arquivo FOREIGN KEY (co_arquivo) REFERENCES tb_arquivo (co_arquivo) ON DELETE CASCADE,
    CONSTRAINT fk_conselho_indicacao_arquivo_conselho_indicacao FOREIGN KEY (co_conselho_indicacao) REFERENCES tb_conselho_indicacao (co_conselho_indicacao) ON DELETE CASCADE
);

-- Column comments

COMMENT ON COLUMN public.rl_conselho_indicacao_arquivo.co_conselho_indicacao_arquivo IS 'chave primária da tabela';
COMMENT ON COLUMN public.rl_conselho_indicacao_arquivo.co_conselho_indicacao IS 'chave estrangeira referente a tabela tb_conselho_indicacao';
COMMENT ON COLUMN public.rl_conselho_indicacao_arquivo.co_arquivo IS 'chave estrangeira referente a tabela tb_arquivo';
COMMENT ON COLUMN public.rl_conselho_indicacao_arquivo.tp_arquivo IS 'tipo do arquivo com slug do módulo.';

-- Permissions

ALTER TABLE public.rl_conselho_indicacao_arquivo
    OWNER TO votacultura;
GRANT ALL ON TABLE public.rl_conselho_indicacao_arquivo TO votacultura;

CREATE TABLE public.tb_organizacao_habilitacao_historico
(
    co_organizacao_habilitacao_historico serial PRIMARY KEY NOT NULL,
    co_organizacao_habilitacao           int,
    co_organizacao                       int                NOT NULL,
    st_avaliacao                         char(1)            NOT NULL,
    ds_parecer                           text,
    dh_avaliacao                         timestamp DEFAULT current_timestamp,
    nu_nova_pontuacao                    int,
    CONSTRAINT tb_organizacao_habilitacao_historico_tb_organizacao_habilitacao_co_organizacao_habilitacao_fk FOREIGN KEY (co_organizacao_habilitacao) REFERENCES public.tb_organizacao_habilitacao (co_organizacao_habilitacao),
    CONSTRAINT tb_organizacao_habilitacao_historico_tb_organizacao_co_organizacao_fk FOREIGN KEY (co_organizacao) REFERENCES public.tb_organizacao (co_organizacao)
);

ALTER TABLE public.tb_organizacao_habilitacao
    ADD co_usuario_avaliador integer NULL;
ALTER TABLE public.tb_organizacao_habilitacao
    ADD CONSTRAINT tb_organizacao_habilitacao_tb_usuario_co_usuario_fk
        FOREIGN KEY (co_usuario_avaliador) REFERENCES public.tb_usuario (co_usuario);


ALTER TABLE public.tb_organizacao_habilitacao_historico
    ADD co_usuario_avaliador integer NULL;
ALTER TABLE public.tb_organizacao_habilitacao_historico
    ADD CONSTRAINT tb_organizacao_habilitacao_historico_tb_usuario_co_usuario_fk
        FOREIGN KEY (co_usuario_avaliador) REFERENCES public.tb_usuario (co_usuario);

ALTER TABLE public.tb_organizacao_habilitacao
    ADD st_revisao_final boolean NULL;
COMMENT ON COLUMN public.tb_organizacao_habilitacao.st_revisao_final IS 'null - Sem avaliação
false - Não é revisão final
true - Última revisão da habilitação';

ALTER TABLE public.tb_organizacao_habilitacao_historico
    ADD st_revisao_final boolean NULL;
COMMENT ON COLUMN public.tb_organizacao_habilitacao_historico.st_revisao_final IS 'null - Sem avaliação
false - Não é revisão final
true - Última revisão da habilitação';

UPDATE public.tb_conselho
SET st_indicacao = 'a';

--########

CREATE TABLE public.tb_organizacao_habilitacao_recurso
(
    co_organizacao_habilitacao_recurso serial    NOT NULL,               -- Chave primária da tabela
    co_organizacao                     int4      NOT NULL,               -- Chave estrangeira referente a organização
    ds_recurso                         text      NOT NULL,               -- Descrição do recurso
    dh_cadastro_recurso                timestamp NOT NULL DEFAULT now(), -- Data de cadastro do recurso
    CONSTRAINT pk_organizacao_habilitacao_recurso PRIMARY KEY (co_organizacao_habilitacao_recurso),
    CONSTRAINT fk_organizacao_habilitacao_recurso FOREIGN KEY (co_organizacao) REFERENCES tb_organizacao (co_organizacao)
);

-- Column comments

COMMENT ON COLUMN public.tb_organizacao_habilitacao_recurso.co_organizacao_habilitacao_recurso IS 'Chave primária da tabela';
COMMENT ON COLUMN public.tb_organizacao_habilitacao_recurso.co_organizacao IS 'Chave estrangeira referente a organização';
COMMENT ON COLUMN public.tb_organizacao_habilitacao_recurso.ds_recurso IS 'Descrição do recurso';
COMMENT ON COLUMN public.tb_organizacao_habilitacao_recurso.dh_cadastro_recurso IS 'Data de cadastro do recurso';

--################## Avaliação do recurso das organizações

ALTER TABLE public.tb_organizacao_habilitacao_recurso
    ADD ds_parecer text NULL;
COMMENT ON COLUMN public.tb_organizacao_habilitacao_recurso.ds_parecer IS 'Parecer do recurso';
ALTER TABLE public.tb_organizacao_habilitacao_recurso
    ADD st_parecer char(1) NULL;
COMMENT ON COLUMN public.tb_organizacao_habilitacao_recurso.st_parecer IS '0 - Inabilitada, 1 = habilitada e desclassificada, 2 habilitada e classificada';
ALTER TABLE public.tb_organizacao_habilitacao_recurso
    ADD st_avaliacao_final integer NOT NULL DEFAULT 0;
COMMENT ON COLUMN public.tb_organizacao_habilitacao_recurso.st_avaliacao_final IS 'Valida se o usuário selecionou o recurso como concluído.';
ALTER TABLE public.tb_organizacao_habilitacao_recurso
    ADD nu_pontuacao integer NULL;
COMMENT ON COLUMN public.tb_organizacao_habilitacao_recurso.nu_pontuacao IS 'Nova pontuação após avaliação do recurso.';

ALTER TABLE public.tb_organizacao_habilitacao_recurso
    OWNER TO votacultura;
GRANT ALL ON TABLE public.tb_organizacao_habilitacao_recurso TO votacultura;

-- Habilitação dos indicados

CREATE TABLE public.tb_conselho_indicacao_habilitacao
(
    co_conselho_indicacao_habilitacao serial PRIMARY KEY      NOT NULL,
    co_indicado                       int                     NOT NULL,
    st_avaliacao                      char(1)                 NOT NULL,
    ds_parecer                        text                    NOT NULL,
    dh_avaliacao                      timestamp DEFAULT now() NOT NULL,
    co_usuario_avaliador              int                     NOT NULL,
    st_revisao_final                  boolean,
    CONSTRAINT tb_conselho_indicacao_habilitacao_tb_usuario_co_usuario_fk FOREIGN KEY (co_usuario_avaliador) REFERENCES public.tb_usuario (co_usuario),
    CONSTRAINT tb_conselho_indicacao_habilitacao_tb_conselho_indicacao_co_conselho_indicacao_fk FOREIGN KEY (co_indicado) REFERENCES public.tb_conselho_indicacao (co_conselho_indicacao)
);
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao.co_conselho_indicacao_habilitacao IS 'chave primaria da tabela';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao.co_indicado IS 'código do indicado pelo conselho de cultura';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao.st_avaliacao IS 'situação da avaliação do indicado';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao.ds_parecer IS 'Descrição do parecer feito pelo avaliador';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao.dh_avaliacao IS 'data e hora da avaliação';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao.co_usuario_avaliador IS 'Código do usuario avaliador do indicado';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao.st_revisao_final IS 'null - Sem avaliação
false - Não é revisão final
true - Última revisão da habilitação';
COMMENT ON TABLE public.tb_conselho_indicacao_habilitacao IS 'registro sobre avaliação dos indicados de cada conselho';

-- Habilitação dos indicados (histórico)

CREATE TABLE public.tb_conselho_indicacao_habilitacao_historico
(
    co_conselho_indicacao_habilitacao_historico serial PRIMARY KEY NOT NULL,
    co_indicado                                 int                NOT NULL,
    st_avaliacao                                char(1)            NOT NULL,
    ds_parecer                                  text               NOT NULL,
    dh_avaliacao                                timestamp          NOT NULL,
    co_usuario_avaliador                        int                NOT NULL,
    CONSTRAINT tb_conselho_indicacao_habilitacao_historico_tb_usuario_co_usuario_fk FOREIGN KEY (co_usuario_avaliador) REFERENCES public.tb_usuario (co_usuario),
    CONSTRAINT tb_conselho_indicacao_habilitacao_historico_tb_conselho_indicacao_co_conselho_indicacao_fk FOREIGN KEY (co_indicado) REFERENCES public.tb_conselho_indicacao (co_conselho_indicacao)
);

COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_historico.co_conselho_indicacao_habilitacao_historico IS 'chave primaria da tabela';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_historico.co_indicado IS 'código do indicado pelo conselho de cultura';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_historico.st_avaliacao IS 'situação da avaliação do indicado';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_historico.ds_parecer IS 'Descrição do parecer feito pelo avaliador';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_historico.dh_avaliacao IS 'data e hora da avaliação';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_historico.co_usuario_avaliador IS 'Código do usuario avaliador do indicado';
COMMENT ON TABLE public.tb_conselho_indicacao_habilitacao_historico IS 'registro sobre avaliação dos indicados de cada conselho';

ALTER TABLE public.tb_organizacao_habilitacao_recurso
    ADD co_arquivo integer NULL;
COMMENT ON COLUMN public.tb_organizacao_habilitacao_recurso.co_arquivo IS 'Código do arquivo referente a tabela tb_arquivo.';
ALTER TABLE public.tb_organizacao_habilitacao_recurso
    ADD CONSTRAINT fk_organizacao_habilitacao_recurso_arquivo FOREIGN KEY (co_arquivo) REFERENCES public.tb_arquivo (co_arquivo);

--########

CREATE TABLE public.tb_conselho_indicacao_habilitacao_recurso
(
    co_conselho_indicacao_habilitacao_recurso serial    NOT NULL,
    co_conselho_indicacao_habilitacao         int       NOT NULL,
    ds_recurso                                text      NULL,
    st_parecer                                char(1)   NULL,
    co_usuario_avaliador                      int       NOT NULL,
    dh_cadastro_recurso                       timestamp NOT NULL DEFAULT now(),
    CONSTRAINT pk_tb_conselho_indicacao_habilitacao_recurso PRIMARY KEY (co_conselho_indicacao_habilitacao_recurso),
    CONSTRAINT fk_conselho_indicacao_habilitacao_recurso FOREIGN KEY (co_conselho_indicacao_habilitacao) REFERENCES public.tb_conselho_indicacao_habilitacao (co_conselho_indicacao_habilitacao)
);

-- Column comments

COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso.co_conselho_indicacao_habilitacao_recurso IS 'Chave primária da tabela';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso.co_conselho_indicacao_habilitacao IS 'Código da habilitação do conselho';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso.ds_recurso IS 'Descrição do recurso.';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso.st_parecer IS 'Parecer do recurso da habilitação. 0 = Inabilitado, 1 = Habilitado';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso.co_usuario_avaliador IS 'Código do usuário que realizou a avaliação.';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso.dh_cadastro_recurso IS 'Data de cadastro do recurso.';


--##############

CREATE TABLE public.tb_conselho_indicacao_habilitacao_recurso_historico
(
    co_conselho_indicacao_habilitacao_recurso_historico serial    NOT NULL,           -- Chave primária da tabela.
    co_conselho_indicacao_habilitacao_recurso           int4      NOT NULL,           -- Chave estrangeira referente a tabela tb_conselho_indicacao_habilitacao_recurso
    ds_recurso                                          text      NULL,               -- Descrição do recurso.
    st_parecer                                          bpchar(1) NULL,               -- Parecer da avaliação do recurso.
    co_usuario_avaliador                                int4      NULL,               -- Código do usuário que realizou a avaliação do recurso.
    dh_cadastro_recurso                                 timestamp NULL DEFAULT now(), -- Data de cadastro do recurso.
    co_conselho_indicacao_habilitacao                   int4      NOT NULL,
    CONSTRAINT pk_conselho_indicacao_habilitacao_recurso_historico PRIMARY KEY (co_conselho_indicacao_habilitacao_recurso_historico),
    CONSTRAINT tb_conselho_indicacao_habilitacao_recurso_historico_fk FOREIGN KEY (co_conselho_indicacao_habilitacao_recurso) REFERENCES tb_conselho_indicacao_habilitacao_recurso (co_conselho_indicacao_habilitacao_recurso)
);

-- Column comments

COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso_historico.co_conselho_indicacao_habilitacao_recurso_historico IS 'Chave primária da tabela.';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso_historico.co_conselho_indicacao_habilitacao_recurso IS 'Chave estrangeira referente a tabela tb_conselho_indicacao_habilitacao_recurso';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso_historico.ds_recurso IS 'Descrição do recurso.';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso_historico.st_parecer IS 'Parecer da avaliação do recurso.';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso_historico.co_usuario_avaliador IS 'Código do usuário que realizou a avaliação do recurso.';
COMMENT ON COLUMN public.tb_conselho_indicacao_habilitacao_recurso_historico.dh_cadastro_recurso IS 'Data de cadastro do recurso.';

--##################


-- Tabela de votação dos indicados
CREATE TABLE public.tb_conselho_votacao
(
    co_conselho_votacao serial PRIMARY KEY NOT NULL,
    dh_voto timestamp DEFAULT now() NOT NULL,
    co_eleitor int NOT NULL,
    co_conselho_indicacao int NOT NULL,
    CONSTRAINT fk_conselho_votacao_indicacao FOREIGN KEY (co_conselho_indicacao) REFERENCES public.tb_conselho_indicacao (co_conselho_indicacao),
    CONSTRAINT tb_conselho_votacao_eleitor FOREIGN KEY (co_eleitor) REFERENCES public.tb_eleitor (co_eleitor)
);
CREATE UNIQUE INDEX tb_conselho_votacao_co_conselho_votacao_uindex ON public.tb_conselho_votacao (co_conselho_votacao);
CREATE UNIQUE INDEX tb_conselho_votacao_co_eleitor_uindex ON public.tb_conselho_votacao (co_eleitor);
COMMENT ON COLUMN public.tb_conselho_votacao.co_conselho_votacao IS 'chave primária da tabela';
COMMENT ON COLUMN public.tb_conselho_votacao.co_eleitor IS 'eleitor do voto';
COMMENT ON COLUMN public.tb_conselho_votacao.co_conselho_indicacao IS 'indicado que recebeu o voto';
COMMENT ON TABLE public.tb_conselho_votacao IS 'tabela de registro de votos dos indicados';



