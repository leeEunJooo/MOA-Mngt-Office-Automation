import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '@/components/user/Login'
import SignUp from '@/components/user/Signup'
import DashBoard from '@/components/DashBoard'
import MOAList from '@/components/moaList/MOAList'
import ListDetail from '@/components/moaList/ListDetail'
import DrawerNav from '@/components/DrawerNav'
import NotFound from '@/components/NotFound'
import Upload from '@/components/moaList/Upload'
import Post from '@/components/moaList/Post'


// Vue와 VueRouter 연결
Vue.use(VueRouter);


// 사용할 route 생성 및 설정
const routes = [
  {
    path:'/',
     redirect: '/login',
  },
  {
    path: '/',
    name: 'drawernav',
    component: DrawerNav,
    children:[
      {
        path:'login',
        component: Login
      },
      {
        path:'signup',
        component: SignUp
      },
      {
        path: 'dashboard',
        component: DashBoard
      },
      {
        path: 'moalist',
        component: MOAList
      },
      {
        path: 'addfile',
        component: MOAList
      },
    ]
  },

  {
    path: '/moalist/:id',
    name: 'listdetail',
    components: {
      default:  ListDetail
    }
  },
  {
    path: '/post',
    name : 'posting',
    component : Post
  },
  {
    path: '/upload',
    name : Upload,
    component : Upload
  },
  {
        path: "/404",
        name: "notFound",
        component: NotFound
    },
  {
      path: '*',
      redirect: "/404"
  },
  
    

]

// VueRouter에 route를 등록하고 설정한다.
const router = new VueRouter({
  routes
})

// 설정한 VueRouter를 내보낸다.
export default router
