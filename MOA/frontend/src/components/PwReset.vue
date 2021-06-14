<template>
  <div class="app">
    <div class="input_row">
      <label for="id">아이디</label>
      <input type="text" id="id" v-model="user.user_id" />
    </div>
    <div class="input_row">
      <label for="password">새로운 비밀번호</label>
      <input type="password" id="password" v-model="user.password1" />
    </div>
    <div class="input_row">
      <label for="password">새로운 비밀번호 확인</label>
      <input type="password" id="password" v-model="user.password2" />
    </div>
    <button v-on:click="pwReset">비밀번호 초기화</button>
  </div>
</template>
<script>
export default {
 methods: {
    pwReset: function () {
      this.$http.post("/api/musers/pwReset", {
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
        .catch(function () {
          alert("error");
        });
    }
  },
  data() {
    return {
      user: {
        user_id: "",
        password1: "",
        password2: "",
      },
    }
  }
}
</script>