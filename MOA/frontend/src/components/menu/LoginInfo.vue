<template>
  <div>
      <div id="notLoggedIn" class="notloggedIn" style = "padding-top: 20px">
          <div v-if="login">
            <button @click="loginAndSignUp">
              로그인/회원가입
            </button>
          </div>
          <div v-else >
            <button @click="$store.dispath('logout')">
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
</template>

<script>
// import { mapState } from "vuex"

export default {
    el:'#notLoggedIn',
     data: function() {
      return {
        users: "",
        login:"",
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
            //  this.$router.reload();
          console.log("??????")
          console.log("1 : " + this.login);
          this.login = false;
          console.log("2: " + this.login);
          console.log(response.data[0]);
          this.users = response.data[0];
        },
        () => {
          alert("로그인 후 이용해주세요.");
          this.$router.push("/login");
        }
        );
      },
      // mounted: {
       
      //   logout(){
      //     this.login=true;
      //     // localStorage.clear();
      //     // this.$store.dispath("logout")
      //     // this.$router.push("/");
      //   },
      //   login(){
      //     this.login = false;
      //   }
      // },
      methods: {
        loginAndSignUp(){
          // this.login = false;
          // localStorage.clear();
          // this.$store.dispath("logout")
          this.$router.push("/login");
        },

        // logout(){
        //   this.login=true;
        //   localStorage.clear();
        //   // this.$store.dispath("logout")
        //   this.$router.push("/").catch(() => {});
        // }
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