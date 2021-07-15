<template>
  <div>
      <div id="notLoggedIn" class="notloggedIn" style = "padding-top: 20px">
          <div v-if="!this.$store.state.isLogin">
            <button @click="loginchk">
              로그인/회원가입
            </button>
          </div>
          <div v-else >
            {{$store.state.username}}님 안녕하세요.<br>
            <button @click="logout">
              로그아웃
            </button>
      </div>
  </div>
  </div>
</template>

<script>

export default {
    data: function() {
     return {
      usernm:this.$store.state.username,
      users: "",
       }
     },
      created(){
        
      },
      methods: {
        logout(){
          this.$store.commit('logout')  
          localStorage.clear(); 
          this.$router.push("/login");

        },
        loginchk(){
          this.$router.push("/login");
          
        }
      },
      

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