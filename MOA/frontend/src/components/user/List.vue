<template>
  <div id="list">
    <div>
      {{users.user_id}}님 안녕하세요.<br>
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
        .then((response) => {
          console.log("??????")
           console.log(response);
           this.users = response.data;
        });
      }
  }
</script>
