<template>
  <v-container>
    <carregando v-if="loading" />
    <v-card v-if="!loading">
      <v-toolbar dark color="primary">
        <v-toolbar-title>Recurso da Habilitação</v-toolbar-title>
      </v-toolbar>
      <v-card-text>
        <v-form ref="form_recurso_habilitacao" v-model="valid" lazy-validation>
          <v-layout class="mt-1">
            <v-flex md12 subheading grey--text mt-2 d-inline-flex>
              <div class="md6">
                <span class="font-weight-bold">Nome da organização/entidade cultural:</span>
                {{ organizacao.no_organizacao}}
              </div>
              <v-spacer />
              <div class="md6">
                <span class="font-weight-bold">CNPJ:</span>
                {{ organizacao.cnpj_formatado }}
              </div>
            </v-flex>
          </v-layout>

          <v-layout class="mt-1">
            <v-flex md12 subheading grey--text mt-2 d-inline-flex>
              <div class="md6">
                <span class="font-weight-bold">Pontuação inicial:</span>
                {{ organizacao.pontuacao }}
              </div>
              <v-spacer />
              <v-spacer />
              <v-spacer />

              <div class="md6">
                <span class="font-weight-bold">Segmento cultural:</span>
                {{ organizacao.segmento ? organizacao.segmento.ds_detalhamento : ''}}
              </div>
            </v-flex>
          </v-layout>

          <v-layout class="mt-1">
            <v-flex md12 subheading grey--text mt-2 d-inline-flex>
              <div class="md6">
                <span class="font-weight-bold">Pontuação após análise:</span>
                {{ organizacao.organizacaoHabilitacao ? organizacao.organizacaoHabilitacao.nu_nova_pontuacao : ''}}
              </div>
            </v-flex>
          </v-layout>

          <v-card class="ma-3">
            <v-layout wrap align-center>
              <v-flex xs12 sm12>
                <div class="ma-4 text-justify subheading grey--text">
                  Ilmo Sr. Secretário da Diversidade Cultural,
                  <br />
                  <br />com base no
                  <b>item 6</b> deste edital de CHAMADA PÚBLICA PARA COMPOSIÇÃO DO
                  CONSELHO NACIONAL DE POLÍTICA CULTURAL (CNPC) no triênio 2019/2022,
                  venho interpor recurso em face do resultado na etapa de habilitação pelos motivos
                  abaixo descritos:
                </div>
              </v-flex>
            </v-layout>
            <v-layout wrap align-center>
              <v-flex xs12 sm12 class="ma-3">
                <v-textarea
                  v-model="habilitacaoRecurso.ds_recurso"
                  :readonly="habilitacaoRecurso.isLocked"
                  :disabled="habilitacaoRecurso.isLocked"
                  name="input-7-1"
                  box
                  solo
                  label="Descrição do recurso"
                  auto-grow
                  :placeholder="'Digite seu recurso aqui.'"
                  :counter="3000"
                  :rules="[rules.required, rules.tamanhoMaximoCaracteres]"
                />
              </v-flex>
            </v-layout>
          </v-card>

          <v-card class="ma-3">
            <v-layout wrap align-center>
              <v-flex xs12 sm12>
                <div class="ma-4 text-justify subheading grey--text">
                  Caso seja necessário o envio de documentos, encaminhar para o e-mail
                  <span class="font-weight-bold">votacultura@cidadania.gov.br</span> informando no assunto: Recurso de habilitação e o nome da organização ou entidade cultural.
                </div>
              </v-flex>
            </v-layout>
          </v-card>

          <v-card class="ma-3 mt-2" mt-2>
            <v-card-text>
              <div class="grey--text mt-2">
                <span class="subheading black--text">Resultado da avaliação do recurso</span>
                <div class="mt-4" md12>
                  <v-select
                    v-model="habilitacaoRecurso.resultadoHabilitacao"
                    :disabled="true"
                    :readonly="true"
                    :items="itemsResultadoHabilitacao"
                    label="*Resultado final da habilitação"
                    append-icon="place"
                    required
                    box
                    :rules="[rules.required]"
                  />
                </div>

                <div class="mt-2">
                  <v-textarea
                    v-model="habilitacaoRecurso.dsParecer"
                    :readonly="true"
                    placeholder="*Parecer"
                    rows="13"
                    row-height="28"
                    :counter="15000"
                    box
                    auto-grow
                    :rules="[rules.required, rules.tamanhoMaximoCaracteres]"
                  />
                </div>

                <v-flex class="mt-2" sm2>
                  <v-text-field
                    v-model="habilitacaoRecurso.pontuacaoFinal"
                    :readonly="true"
                    :disabled="true"
                    type="number"
                    min="0"
                    max="99"
                    step="1"
                    mask="##"
                    label="Pontuação final"
                  />
                </v-flex>
              </div>
            </v-card-text>
            <v-container>
              <v-flex md12 v-if="Object.keys((habilitacaoRecurso.arquivo || {})).length > 0" class="mt-2">
                <span class='subheading'>Anexo</span>
                <v-card>
                  <v-card-text class="grey--text mt-2">
                    <div mt-2 class="text-xs-center black--text">
                      <v-layout align-center justify-center>
                        <v-flex sm6>
                          <v-layout>
                            <v-flex class="text-md-center title">{{habilitacaoRecurso.arquivo.no_arquivo}}</v-flex>
                            <div sm1>
                              <v-icon
                                size="32px"
                                color="blue darken-4"
                                @click="downloadArquivo(habilitacaoRecurso.arquivo.co_arquivo)"
                              >cloud_download</v-icon>
                            </div>
                          </v-layout>
                        </v-flex>
                      </v-layout>
                    </div>
                  </v-card-text>
                </v-card>
              </v-flex>

            </v-container>
          </v-card>
        </v-form>
      </v-card-text>
      <v-layout wrap align-center>
        <v-flex offset-xs5>
          <v-btn to="/">Cancelar</v-btn>
          <v-btn
            :readonly="habilitacaoRecurso.isLocked"
            :disabled="habilitacaoRecurso.isLocked || !valid"
            color="primary"
            @click="abrirDialogo"
          >Enviar</v-btn>
        </v-flex>
      </v-layout>
    </v-card>

    <v-layout justify-center>
      <v-dialog v-model="dialog" max-width="360">
        <v-card>
          <v-card-title class="headline">Deseja realmente enviar?</v-card-title>

          <v-card-text>Os dados enviados não poderão ser alterados posteriormente.</v-card-text>

          <v-card-actions>
            <v-spacer />

            <v-btn color="red darken-1" text flat @click="fecharDialogo">Não</v-btn>

            <v-btn color="green darken-1" text flat @click="salvar">Sim</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-layout>
  </v-container>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import Validate from "../../shared/util/validate";
import File from "@/core/components/upload/File";
import Carregando from "../../shared/components/CardCarregando";

export default {
  components: { Carregando, File },
  data: () => ({
    loading: true,
    dialog: false,
    valid: false,
    usuarioLogado: {},
    organizacao: {},
    habilitacaoRecurso: {
      ds_recurso: "",
      isLocked: false,
      dsParecer: "",
      resultadoHabilitacao: "",
      pontuacaoFinal: 0,
      arquivo : {}
    },
    itemsResultadoHabilitacao: [
      { value: "", text: "" },
      { value: "0", text: "Inabilitada" },
      { value: "1", text: "Habilitada e desclassificada" },
      { value: "2", text: "Habilitada e classificada" }
    ],
    rules: {
      required: value => !!value || "Campo não preenchido",
      tamanhoMaximoCaracteres: value =>
        (!!value && value.length <= 3000) || "Máximo 3000 caracteres"
    }
  }),
  watch: {
    usuario(valor) {
      this.usuarioLogado = valor;
    },
    usuarioLogado(usuario) {
      if (usuario.co_organizacao) {
        this.obterDadosOrganizacao(usuario.co_organizacao);
      }
    },
    organizacaoGetter(value) {
      this.organizacao = value;
    }
  },
  computed: {
    ...mapGetters({
      usuario: "conta/usuario",
      organizacaoGetter: "organizacao/organizacao"
    })
  },
  methods: {
    ...mapActions({
      enviarDadosOrganizacaoHabilitacaoRecurso:
        "organizacao/enviarDadosOrganizacaoHabilitacaoRecurso",
      definirMensagemSucesso: "app/setMensagemSucesso",
      definirMensagemErro: "app/setMensagemErro",
      obterDadosOrganizacao: "organizacao/obterDadosOrganizacao",
      downloadArquivo: "shared/downloadArquivo"
    }),
    salvar() {
      this.loading = true;
      const dadosSubmit = {
        dsRecurso: this.habilitacaoRecurso.ds_recurso
      };

      this.enviarDadosOrganizacaoHabilitacaoRecurso(dadosSubmit)
        .then(response => {
          this.definirMensagemSucesso(response.data.message);
          this.$router.push("/");
        })
        .finally(() => {
          this.loading = false;
          this.fecharDialogo();
        });
    },
    abrirDialogo() {
      if (!this.$refs.form_recurso_habilitacao.validate()) {
        return false;
      }
      this.dialog = true;
      return true;
    },
    fecharDialogo() {
      this.dialog = false;
    }
  },

  beforeUpdate() {
    if (!this.usuario.co_organizacao) {
      this.definirMensagemErro(
        "Acesso restrito as organizações e entidades culturais."
      );
      this.$router.push("/");
    }
  },
  mounted() {
    const self = this;
    self
      .obterDadosOrganizacao(this.usuario.co_organizacao)
      .then(dadosOrganizacao => {
        if (typeof dadosOrganizacao.habilitacaoRecurso !== undefined) {
          const recurso = dadosOrganizacao.habilitacaoRecurso;
          self.habilitacaoRecurso.ds_recurso = recurso.ds_recurso;
          self.habilitacaoRecurso.dsParecer = recurso.ds_parecer;
          self.habilitacaoRecurso.pontuacaoFinal = recurso.nu_pontuacao;
          self.habilitacaoRecurso.resultadoHabilitacao = recurso.st_parecer;
          self.habilitacaoRecurso.arquivo = recurso.arquivo;
          //       dsParecer: '',
          // resultadoHabilitacao: '',
          // pontuacaoFinal: 0
        }
      })
      .finally(() => {
        self.habilitacaoRecurso.isLocked = true;
        self.loading = false;
      });
  }
};
</script>
