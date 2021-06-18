<template>
<div class="login_box">
  <v-card
    :loading="loading"
    class="mx-auto my-12"
    max-width="470"
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
          cols="13"
          sm="6"
          md="12"
        >
          <v-text-field
            label="아이디를 입력해주세요"
            placeholder="아이디를 입력해주세요"
            required
            solo
            v-model="user.user_id"
          ></v-text-field>

            <v-text-field
            label="비밀번호를 입력해주세요"
            placeholder="비밀번호를 입력해주세요"
            required
            solo
            type="password"
            v-model="user.user_pwd"
          ></v-text-field>
  
        <v-row style="width:100%"> 
            <!--로그인 상태 유지-->
            <div class="login_save_box" style="padding-top: 10px">
                <v-checkbox
                    v-model="ex4"
                    label="로그인 상태 유지"
                    hide-details
                    style="padding-left:20px;"
                ></v-checkbox>
            </div>
            <!--비밀번호 초기화-->
            <div class="reset_pw_box" style="padding-left: 75px" >
                <ResetPW></ResetPW>
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
  // import axios from 'axios';
 
  import ResetPW from './ResetPW.vue'

  export default {
    // data: () => ({
    //   loading: false,
    //   selection: 1,
    // }),

    data:function() {
      return {
        user:{
          user_id: "",
          user_pwd: "",
        }
      }
    },

    methods: {
      // reserve () {
      //   this.loading = true
      //   setTimeout(() => (this.loading = false), 2000)
      // },
      login: function () {
      this.$http
        .post("/api/musers/login", {
          user: this.user,
        })
        .then(
          (res) => {
            //로그인 성공
            localStorage.setItem('token', JSON.stringify(res.data.token));
            // localStorage.setItem('isLogin', true);
            localStorage.setItem('loginUser', JSON.stringify(res.data));
            // localStorage.setItem("loginUsername", res.data.user_name);
            console.log(res);
            console.log(res.data.token);
            console.log(JSON.parse(localStorage.getItem('token')).user.user_id);
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
    },
    reserve () {
        this.loading = true
        setTimeout(() => (this.loading = false), 2000)
      },
    },
    components:{
      ResetPW
    }
  }
</script>


<style>

.login_box .v-card__title{
    display: block !important;
    text-align: center;
}
.login_box .btn1{
    margin:  15px 0px;
    background-color: #4f3dd8 !important;
    color: white !important;
    font-weight: bold !important;
}
.login_box .btn2{
    color : #4f3dd8 !important;
    font-weight: bold !important;
}
.login_box .v-checkbox{
    background-color: #4f3dd8 !important; 
}

.login_box .v-card__title{
    color : #4f3dd8 !important;
    font-weight: bold !important;
}
.login_save_box,
.reset_pw_box{
  width: 50%;
  margin: 0 !important;
}
.login_save_box .v-input--checkbox{
  margin:0 !important;
  font-size: 13px !important;
}

</style>