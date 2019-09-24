import RoutersSite from '@/modules/site/router';
import RoutersConta from '@/modules/conta/router';
import RoutersOrganizacao from '@/modules/organizacao/router';
import RoutersConselho from '@/modules/conselho/router';
import RoutersEleitor from '@/modules/eleitor/router';
import RoutersRecurso from '@/modules/recurso/router';

export default [
  ...RoutersSite,
  ...RoutersConta,
  ...RoutersOrganizacao,
  ...RoutersConselho,
  ...RoutersEleitor,
  ...RoutersRecurso,
];
