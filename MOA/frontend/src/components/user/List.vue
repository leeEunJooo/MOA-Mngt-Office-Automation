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

  import axios from 'axios';

  export default {
    data: function() {
      return {
        users: []
        }
      },

    method:{
      created() {
        axios
        .get("/api/musers/userinfo", {
          user_id: localStorage.getItem("loginUser")
          })
        .then((response) => {
          this.users = response.data;
        });
      }
    }
  }
</script>

<style>
.list{
    width: 1000px;
    height: 700px;
    margin: 55px auto;
    box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
    background-color: #ffffff;
}

.list > .header{
    width:100%;
    height: 80px;
}

</style>