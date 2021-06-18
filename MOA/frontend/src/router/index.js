import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '@/components/user/Login'
import SignUp from '@/components/user/Signup'
import List from '@/components/user/List'

// Vue와 VueRouter 연결
Vue.use(VueRouter);

// const loginCheck = () => (to, from, next) => {
//   if (localStorage.is_logined == 'true')
//     return next();
//   else
//     alert("로그인이 필요합니다.");
// }

// 사용할 route 생성 및 설정
const routes = [
  {
    path: '/',
    name: 'login',
    component: Login
  },
  {
    path: '/signup',
    name: 'signup',
    component: SignUp
  },

]

// VueRouter에 route를 등록하고 설정한다.
const router = new VueRouter({
  routes
})

// 설정한 VueRouter를 내보낸다.
export default router
