import Vue from 'vue';
import '@/core/plugins/vuetify';
import { sync } from 'vuex-router-sync';
import App from './App';
import router from './router';
import store from './store';
import './registerServiceWorker';
import 'roboto-fontface/css/roboto/roboto-fontface.css';
import 'material-design-icons-iconfont/dist/material-design-icons.css';

Vue.config.productionTip = false;

sync(store, router);

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app');
