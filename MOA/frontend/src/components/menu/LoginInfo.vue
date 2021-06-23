<template>
  <div>
      <div id="notLoggedIn" class="notloggedIn" style = "padding-top: 20px">
          <div v-if="login_state">
            <button @click="loginchk">
              로그인/회원가입
            </button>
          </div>
          <div v-else >
            <button @click="logout">
              로그아웃
            </button>
      </div>
  </div>
   <!-- <div v-else>
      <div id="notLoggedIn" class="notloggedIn" style = "padding-top: 20px">
          <router-link to="/" @click = "logout">
            로그아웃
          </router-link>
      </div>
   </div> -->
  </div>
</template>

<script>
export default {
    el:'#notLoggedIn',
    data: function() {
     return {
      users: "",
      login_state:true,
      localStorage:[],
       }
     },
      created:function() {
      this.$http
        .post("/api/musers/userinfo", {
          user_id: JSON.parse(localStorage.getItem('token')).user.user_id
          })
        .then(
          (response) => {
          console.log("??????")
          this.login_state = false;
           console.log(response.data[0]);
           this.users = response.data[0];
        },
        () => {
          alert("로그인후 이용해주세요.");
          this.$router.push("/login");
        }
        );
      },
      methods: {
        logout(){
          this.login_state=true;
          localStorage.clear();
          // this.$store.dispath("logout")
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