<template>

  <div id="app">
    <DrawerNav></DrawerNav>
    <!-- <img alt="Vue logo" src="./assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/> -->
    
    <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/login">로그인</router-link> |
      <router-link to="/signUp">회원가입</router-link>
      <router-link to="/pwReset">비밀번호 초기화</router-link>
    </div>
    <!-- <router-view></router-view> -->
  </div>
</template>

<script>
import DrawerNav from './components/DrawerNav.vue';

export default {
  name: 'App',
  components: {
    DrawerNav,
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>