<template>
  <div class="app">
    <div class="input_row">
      <label for="id">아이디</label>
      <input type="text" id="id" v-model="user.user_id" />
    </div>
    <div class="input_row">
      <label for="name">이름</label>
      <input type="text" id="name" v-model="user.user_name" />
    </div>
    <div class="input_row">
      <label for="password">비밀번호</label>
      <input type="password" id="password" v-model="user.password" />
    </div>
    <button v-on:click="signUp">가입하기</button>
  </div>
</template>
<script>
export default {
 methods: {
    signUp: function (event) {
      this.$http.post("/api/musers/signUp", {
          user: this.user,
        })
        .then((res) => {
          if (res.data.success == true) {
            alert(res.data.message);
            this.$router.push("/login");
          }
          if (res.data.success == false) {
            alert(res.data.message);
          }
        })
        .catch(function (error) {
          alert("error");
        });
    }
  },
  data() {
    return {
      user: {
        user_id: "",
        user_name: "",
        password: "",
      },
    }
  }
}
</script>