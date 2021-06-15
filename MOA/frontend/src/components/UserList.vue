// 받아온 데이터의 각 컬럼값을 호출할 때 DB의 컬럼명과 정확히 일치해야 함
// DB의 컬럼명이 USER_ID라면 user_id라 적으면 출력 X, USER_ID로 적으면 출력 O
<template>
  <div class="hello">
    <div v-for="(user, index) in users" :key="index" class="user-wrap">
      <h2>No. {{ index + 1 }}</h2>
      <dl>
        <dt>아이디 : </dt>
        <dd>{{ user.USER_ID }}</dd>
        <dt>이름 : </dt>
        <dd>{{ user.USER_NAME }}</dd>
        <dt>전화번호 : </dt>
        <dd>{{ user.PHONE_NUM }}</dd>
        <dt>업로드수 : </dt>
        <dd>{{ user.UPLOAD_CNT }}</dd>
      </dl>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      users: [],
    }
  },
  created() {
    this.$http.get("/api/musers")
    .then((response) => {
      console.log(response);
      this.users = response.data;
    });
  }
};
</script>
 