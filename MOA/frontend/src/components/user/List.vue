<template>
  <div id="list">
    <div >
      {{users.USER_ID}}님 안녕하세요.<br>
      여기는 홈 입니다.<br>
     </div>
  	<!-- <button class="btn" v-on:click="goAdmin">Admin</button> -->
  </div>
 </template>

<script>
  export default {
    data: function() {
      return {
        users: [],
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
           console.log(response.data[0]);
           this.users = response.data[0];
        },
        () => {
          alert("로그인후 이용해주세요.");
          this.$router.push("/");
        }
        );
      }
  }
</script>
