<template>
  <div>
      <div id="notLoggedIn" class="notloggedIn" style = "padding-top: 20px">
          <router-link to="/" class="login-info-link">
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
        
        margin:auto !important;
    }
    .login-info-link {
      color: #585858 !important;
    }
    #notLoggedIn > a:hover{
      font-weight: bold !important;
    }
    #notLoggedIn > a{
      color: #585858 !important;
      transition:all .08s !important;
    }
</style>