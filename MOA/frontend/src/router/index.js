import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '@/components/user/Login'
import SignUp from '@/components/user/Signup'
import DashBoard from '@/components/DashBoard'
import MOAList from '@/components/moaList/MOAList'
import ListDetail from '@/components/moaList/ListDetail'
import DrawerNav from '@/components/DrawerNav'
import NotFound from '@/components/NotFound'
// import Upload from '@/components/moaList/Upload'
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
        component: Login,
        meta : {authRequired : false}
      },
      {
        path:'signup',
        component: SignUp,
        meta : {authRequired : false}
      },
      {
        path: 'dashboard',
        component: DashBoard,
        meta : {authRequired : true}
      },
      {
        path: 'moalist',
        component: MOAList,
        meta : {authRequired : true}
      },
      {
        path: 'addfile',
        component: MOAList,
        meta : {authRequired : true}
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

// to : 이동할 URL정보가 담긴 라우터 객체
// from : 현재 url 정보가 담긴 라우터 객체
// next : to에서 저장한 URL로 이동하기 위해 반드시 호출해야하는 함수.
router.beforeEach((to, from, next) => {
   // 여기서 무엇을 해야 할까? 
  const loggedIn = JSON.parse(localStorage.getItem('token'))==null? false : true;
  console.log(to);
  console.log(from.path);
  console.log(next);
  console.log(loggedIn);


  //로그인 상태가 필요
  if (to.matched.some(record => record.meta.authRequired)) { // 로그인 상태가 아니면 '/' 여기로 보내버린다. 
      console.log('authRequired');
      if (loggedIn) {
        console.log('loggedin');
        next();
      }

  }
  else{
    console.log('NoauthRequired');
    if (loggedIn) {
        console.log('Butloggedin');
        if(to.path == '/' || to.path == '/login' || to.path == '/signup'){
           next({path:'/moalist'});
           return;
        }
      }
    next();
    }
  })

// 설정한 VueRouter를 내보낸다.
export default router
