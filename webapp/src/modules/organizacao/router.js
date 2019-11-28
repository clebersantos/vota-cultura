import { DefaultLayout } from '@/core/components/layouts';

export default [
  {
    path: '/organizacao',
    name: 'Organizacao',
    component: DefaultLayout,
    meta: {
      title: 'Organizacao',
      group: 'apps',
      icon: '',
      public: true,
    },
    redirect: '/organizacao/inscricao',
    children: [
      {
        path: '/organizacao/inscricao',
        name: 'InscricaoOrganizacao',
        meta: {
          title: 'Inscrição Organização',
          group: 'apps',
          icon: 'dashboard',
          public: true,
        },
        component: () => import(/* webpackChunkName: "organizacao-inscricao" */ '@/modules/organizacao/views/Organizacao.vue'),
      },
      {
        path: '/organizacao/habilitacao-recurso',
        name: 'OrganizacaoHabilitacaoRecursoRoute',
        meta: {
          title: 'Recurso da habilitação',
          group: 'apps',
          icon: 'gavel',
          public: false,
        },
        component: () => import(/* webpackChunkName: "organizacao-cadastra-recurso-habilitacao" */ '@/modules/organizacao/views/OrganizacaoHabilitacaoRecurso.vue'),
      },
      {
        path: '/organizacao/revisao-organizacao',
        name: 'InscricaoOrganizacaoRevisao',
        meta: {
          title: 'Revisão - Dados Organização',
          group: 'apps',
          icon: 'dashboard',
          public: true,
        },
        component: () => import(/* webpackChunkName: "organizacao-revisao-organizacao" */ '@/modules/organizacao/views/RevisaoOrganizacao.vue'),
      },
      {
        path: '/organizacao/detalhes-inscricao',
        name: 'OrganizacaoDetalhesInscricaoRoute',
        meta: {
          title: 'Detalhes da inscrição',
          group: 'apps',
          icon: 'dashboard',
          public: false,
        },
        component: () => import(/* webpackChunkName: "organizacao-detalhes-inscricao" */ '@/modules/organizacao/views/OrganizacaoDetalhesInscricao.vue'),
      },
      {
        path: '/organizacao/lista-habilitacao',
        name: 'OrganizacaoListaHabilitacaoRoute',
        meta: {
          title: 'Habilitação de organizações',
          group: 'apps',
          icon: 'dashboard',
          public: false,
        },
        component: () => import(/* webpackChunkName: "eleitor" */ '@/modules/organizacao/views/OrganizacaoListaHabilitacao.vue'),
      },
      {
        path: '/organizacao/documentacao-comprobatoria',
        name: 'OrganizacaoDocumentacaoComprobatoriaRoute',
        meta: {
          title: 'Enviar documentação',
          group: 'apps',
          icon: 'dashboard',
          public: false,
        },
        component: () => import(/* webpackChunkName: "organizacao-documentacao-comprobatoria" */ '@/modules/organizacao/views/OrganizacaoDocumentacaoComprobatoria.vue'),
      },
      {
        path: '/organizacao/lista-recurso-habilitacao',
        name: 'AdministradorAvaliadorHabilitacaoRecursoRoute',
        meta: {
          title: 'Recurso da habilitação',
          group: 'apps',
          icon: 'gavel',
          public: false,
        },
        component: () => import(/* webpackChunkName: "administrador-avaliador-recurso-habilitacao" */ '@/modules/organizacao/views/OrganizacaoListaHabilitacaoRecurso.vue'),
      },
      {
        path: '/organizacao/indicacao',
        name: 'OrganizacaoIndicacaoRoute',
        meta: {
          title: 'Indicados das organizações/entidades culturais',
          group: 'apps',
          icon: 'person_pin',
          public: false,
        },
        component: () => import(/* webpackChunkName: "organizacao-indicado" */ '@/modules/organizacao/views/OrganizacaoIndicado.vue'),
      },
      {
        path: '/organizacao/resultado-final-indicados',
        name: 'OrganizacaoResultadoFinalIndicadosRoute',
        meta: {
          title: 'Resultado final',
          group: 'dashboard',
          icon: 'dashboard',
          public: true,
        },
        component: () => import(/* webpackChunkName: "organizacao-indicado" */ '@/modules/organizacao/views/OrganizacaoResultadoFinalIndicado.vue'),
      },
    ],
  },
];
