import Vue from 'vue'
import App from './App.vue'
import axios from 'axios'
import router from './router'
import vuetify from './plugins/vuetify'
import { store } from './store/store'

Vue.config.productionTip = false
Vue.prototype.$http = axios;
Vue.config.devtools = false;


new Vue({
  router,
  vuetify,
  store,
  render: h => h(App)
}).$mount('#app')
