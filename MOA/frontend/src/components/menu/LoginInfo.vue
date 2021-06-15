<template>
  <div>
      <div id="notLoggedIn" class="notloggedIn" style = "padding-top: 20px">
          <router-link to="/">
            로그인/회원가입
          </router-link>
      </div>
      
  </div>
</template>

<script>
export default {

}
</script>

<style>
    .notloggedIn{
        width:100%;
        height: inherit;
        text-align: center;
        text-decoration: underline;
        margin:auto !important;
    }
</style>