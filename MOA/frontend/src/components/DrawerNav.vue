<template>

  <v-app id="inspire">
    <v-navigation-drawer
      v-model="drawer"
      app
    >
      <!--왼쪽 매뉴-->
      <LoginInfo class="loginInfo"></LoginInfo>
      <!--구분선-->
      <hr class="nav_line"/>
      <!--메뉴-->
      <MenuList class="menu_list"></MenuList>

    </v-navigation-drawer>

    <v-app-bar app>
      <v-app-bar-nav-icon @click="drawer = !drawer">
      </v-app-bar-nav-icon>
      <v-toolbar-title class="header-title">MOA</v-toolbar-title>

      
    </v-app-bar>

    <v-main class="main-content">
      <!--로그인 정보-->
      <router-view> </router-view>
    </v-main>
    
  </v-app>
</template>

<script>
  import Vue from 'vue'
  import VueRouter from 'vue-router'  
  import LoginInfo from './menu/LoginInfo.vue';
  import MenuList from './menu/MenuList.vue';
  import Login from './user/Login.vue';
  import Signup from './user/Signup.vue';
  import List from './user/List.vue';
  
  Vue.use(VueRouter)

  var Router = new VueRouter({
    routes : [
                //메인페이지 정보
                {
                  path:'/',
                  component:Login
                },
                {
                  path:'/signup',
                  component:Signup
                },
                {
                  path:'/list',
                  component:List
                },
                
            ]
  });

  
  export default {
    data: () => ({ drawer: null }),

    components: {
      LoginInfo,
      MenuList,
    },
    router:Router
  }
  
  
</script>

<style>
  .main-content{
    background-color:#f5f7fc;
  }
  .header-title{
    font-family: GmarketSansBold;
    color: #5244f5;
  }
  .v-toolbar__content{
    height:70px;
    background-color:white;
    box-shadow: 0 3px 2px 0 rgba(98, 104, 255, 0.08) !important;
  }
  /* 로그인 정보 */

  .loginInfo{
    width: 82%;
    height: 70px;
    margin: 20px 9%;
    padding: auto 0px !important;
    border-radius: 10px;
    background-color: #f4f4ff;
  }
  .nav_line{
    width:82%;
    height: 0.5px;
    margin:0px auto;
    background-color: #707070;
    opacity: 0.22;
  }
  .menu_list{
    width:82%;
    margin: 50px auto;
    margin-top:50px;
    
  }
</style>