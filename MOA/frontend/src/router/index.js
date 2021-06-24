import Vue from 'vue'
import VueRouter from 'vue-router'
import vueMoment from 'vue-moment'
import Login from '@/components/user/Login'
import SignUp from '@/components/user/Signup'
import DashBoard from '@/components/DashBoard'
import MOAList from '@/components/MOAList'


// Vue와 VueRouter 연결
Vue.use(VueRouter);
Vue.use(vueMoment);


// 사용할 route 생성 및 설정
const routes = [
  {
    path: '/',
    name: 'moalist',
    component: MOAList
  },
  {
    path: '/login',
    name: 'login',
    component: Login
  },
  {
    path: '/signup',
    name: 'signup',
    component: SignUp
  },
  {
    path: '/dashboard',
    name: 'dashboard',
    component: DashBoard
  },
  {
    path: '/moalist',
    name: 'moalist',
    component: MOAList
  },
  // {
  //   path: '/',
  //   name: 'login',
  //   component: Login
  // }

]

// VueRouter에 route를 등록하고 설정한다.
const router = new VueRouter({
  routes
})

// 설정한 VueRouter를 내보낸다.
export default router
