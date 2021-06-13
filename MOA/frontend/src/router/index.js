import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '@/components/UserList'
import Login from '@/components/Login'
import SignUp from '@/components/SignUp'
import PwReset from '@/components/PwReset'

// Vue와 VueRouter 연결
Vue.use(VueRouter)

// 사용할 route 생성 및 설정
const routes = [
  {
    path: '/',
    name: 'index',
    component: Index
  },
  {
    path: '/login',
    name: 'login',
    component: Login
  },
  {
    path: '/signUp',
    name: 'signUp',
    component: SignUp
  },
  {
    path: '/pwReset',
    name: 'pwReset',
    component: PwReset
  }
]

// VueRouter에 route를 등록하고 설정한다.
const router = new VueRouter({
  routes
})

// 설정한 VueRouter를 내보낸다.
export default router
