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
      <router-link to="/" class="home-link">
        <v-toolbar-title class="header-title">MOA</v-toolbar-title>
      </router-link>
    </v-app-bar>

    <!-- <MOAList></MOAList> -->

    <v-main class="main-content">
      <!--로그인 정보-->
      <router-view> </router-view>
    </v-main>
    
  </v-app>
</template>

<script>
 
  import LoginInfo from './menu/LoginInfo.vue';
  import MenuList from './menu/MenuList.vue';

  export default {
    data: () => ({ drawer: null }),

    components: {
      LoginInfo,
      MenuList,
      // MOAList

    },
  }
  
  
</script>

<style>
  .v-sheet.v-toolbar:not(.v-sheet--outlined){
    box-shadow:none !important;
  }
  .main-content{
    background-color:#f5f7fc;
  }
  .header-title{
    font-family: GmarketSansBold;
    font-size: 25px !important;
    color: #5244f5;
    padding-left: 20px;
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
  .home-link{
    font-family: GmarketSansBold;
    color: #5244f5;
    text-decoration: none !important;
  }
</style>