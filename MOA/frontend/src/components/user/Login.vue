<template>
<div class="login_box">
  <v-card
    :loading="loading"
    class="mx-auto my-12"
    max-width="430"
  >
    <template slot="progress">
      <v-progress-linear
        color="deep-purple"
        height="10"
        indeterminate
      ></v-progress-linear>
    </template>

    <br>
 
    <v-card-title>MOA 로그인</v-card-title>

    <v-card-text>
      <v-row
        align="center"
        class="mx-0"
      >
       
      </v-row>

    </v-card-text>

    <!--선-->
    <!-- <v-divider class="mx-4"></v-divider> -->

   

    <v-col
          cols="12"
          sm="6"
          md="12"
        >
          <v-text-field
            v-model="user.user_id"
            label="아이디를 입력해주세요"
            placeholder="아이디를 입력해주세요"
            required
            solo
          ></v-text-field>

            <v-text-field
            v-model="user.password"
            label="비밀번호를 입력해주세요"
            placeholder="비밀번호를 입력해주세요"
            required
            solo
          ></v-text-field>
  
        <v-row> 
            
            <div style="padding-left : 22px">
                <v-checkbox
                    v-model="ex4"
                    label="로그인 상태 유지"
                    value="indigo"
                    hide-details
                ></v-checkbox>
            </div>
            <div style="padding-top : 22px; margin-left : 120px">
                <a href="" class="href-link">비밀번호 초기화</a>
            </div>
        </v-row>
    </v-col>

    <v-col>
        <v-btn class="btn1"
        v-on:click="login" 
        block
        >
            로그인
        </v-btn>
        
        <router-link to="signup">
          <v-btn class = "btn2" block>
            회원가입
          </v-btn>
        </router-link>
    </v-col>

   <br>
   <br>

  </v-card>
  
</div>

</template>


<script>
  import axios from 'axios';
 
  export default {
    // data: () => ({
    //   loading: false,
    //   selection: 1,
    // }),

    data:function() {
      return {
        user:{
          user_id: "",
          password: "",
        }
      }
    },

    methods: {
      // reserve () {
      //   this.loading = true
      //   setTimeout(() => (this.loading = false), 2000)
      // },
      login: function () {
      axios
        .post("/api/musers/login", {
          user: this.user,
        })
        .then(
          (res) => {
            //로그인 성공
            localStorage.setItem("token", res.data.token);
            localStorage.setItem("isLogin", true);
            localStorage.setItem("loginUser", res.data.user_id);
            localStorage.setItem("loginUsername", res.data.user_name);
            console.log(res);
            alert(res.data.message);
            this.$router.push("/list");
          },
          () => {
            // error 를 보여줌
            alert("아이디가 없대");
          }
        )
        .catch((err) => {
          alert(err);
        });
    }
    },
  }
</script>


<style>
.v-card__title{
    display: block !important;
    text-align: center;
}
.btn1{
    margin:  15px 0px;
    background-color: #4f3dd8 !important;
    color: white !important;
    font-weight: bold !important;
}
.btn2{
    color : #4f3dd8 !important;
    font-weight: bold !important;
}
.v-checkbox{
    background-color: #4f3dd8 !important; 
}
.v-btn__content{
    color: white;
}
.v-card__title{
    color : #4f3dd8 !important;
    font-weight: bold !important;
}

</style>