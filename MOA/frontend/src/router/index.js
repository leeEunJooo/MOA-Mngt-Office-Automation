import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '@/components/user/Login'
import SignUp from '@/components/user/Signup'

// Vue와 VueRouter 연결
Vue.use(VueRouter)

// 사용할 route 생성 및 설정
const routes = [
  {
    path: '/',
    name: 'login',
    component: Login
  },
  {
    path: '/signUp',
    name: 'signUp',
    component: SignUp
  },

]

// VueRouter에 route를 등록하고 설정한다.
const router = new VueRouter({
  routes
})

// 설정한 VueRouter를 내보낸다.
export default router
