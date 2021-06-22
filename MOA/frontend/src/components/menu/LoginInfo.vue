<template>
  <div>
      <div id="notLoggedIn" class="notloggedIn" style = "padding-top: 20px">
          <div v-if="login">
            <button @click="login">
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
</template>

<script>
export default {
    el:'#notLoggedIn',
     data: function() {
      return {
        users: "",
        login:true,
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
          this.login = false;
           console.log(response.data[0]);
           this.users = response.data[0];
        },
        () => {
          alert("로그인후 이용해주세요.");
          this.$router.push("/");
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
        logout(){
          this.login=true;
          localStorage.clear();
          // this.$store.dispath("logout")
          this.$router.push("/");
        }
      },

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