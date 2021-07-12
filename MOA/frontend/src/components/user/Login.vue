<template>
<div class="login_box">
  <div class="card_box">
    <div class="card-content">
      <v-card-title>MOA 로그인</v-card-title>
          <v-text-field
            label="아이디를 입력해주세요"
            placeholder="아이디를 입력해주세요"
            required
            solo
            v-model="user.user_id"
            class="login-input1"
          ></v-text-field>

            <v-text-field
            label="비밀번호를 입력해주세요"
            placeholder="비밀번호를 입력해주세요"
            required
            solo
            type="password"
            v-model="user.user_pwd"
            class="login-input2"
          ></v-text-field>
  
        <v-row style="width:100%" class="login-save-rspw-box"> 
            <!--로그인 상태 유지-->
            <div class="login_save_box">
                <v-checkbox
                  v-model="login_st"
                  :label="`로그인 상태 유지 ${login_st.toString()}`"
                  color="indigo"
                ></v-checkbox>
            </div>
            <!--비밀번호 초기화-->
            <div class="reset_pw_box" style="padding-left: 75px" >
                <ResetPW></ResetPW>
            </div>
        </v-row>
        
        <v-btn class="btn1"
        v-on:click="login" 
        block
        >
            로그인
        </v-btn>
        
        <router-link to="signup" class="signup-link">
          <v-btn class = "btn2" block>
            회원가입
          </v-btn>
        </router-link>
        </div>
  </div>
</div>
</template>

<script>
  // import axios from 'axios';
 
  import ResetPW from './ResetPW.vue'

  export default {

    data: function () {
    return {
      user: {
        user_id: "",
        password: "",
      },
      login_st:false,
    }
    },

    methods: {
      login: function() {
        this.$http.post("/api/musers/login", {
          user: this.user,
        })
        .then(
          (res) => {
            if(res.data.success == true){
              //로그인 성공
              localStorage.setItem('token', JSON.stringify(res.data.token));
              localStorage.setItem('loginUser', JSON.stringify(res.data));
              this.$store.commit('loginToken', {token:JSON.stringify(res.data.token), user_nm:res.data.token.user.user_id});
              alert(res.data.message);
              
              this.$router.push("/moalist");
            }
            if (res.data.success == false) {
              alert(res.data.message);
              this.$router.go();
           }
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
    mounted(){
      var login_save_box = document.querySelector('.reset_pw_box');
      console.log(login_save_box.firstChild.classList.value);
      login_save_box.firstChild.classList.remove('text-center')
       
        // ('text-center')
        // console.log( login_save_box.classList.remove('text-center'));
    },

    components:{
      ResetPW
    },
    
  }
</script>
<style>
  .login_box{
    height: 100%;
    display: flex;
    align-items: center;
    
  }
  .login_box .card_box{
    margin: auto;
    background-color: white;
    width:520px;
    height: 600px;
    box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.16);
  }
  .login_box .card-content{
    padding: 65px 95px 65px 95px;
    height: 100%;
  }
  .login_box .v-input__slot{
    height: 52px;
    border-radius: 6px;
    box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.16) !important;
  }
  .login_box .login-input1{
    margin-top:60px !important;
  }
  .login_box .login-input2{
    margin-top:-10px !important;
  }

  .login_box .v-card__title{
      display: block !important;
      text-align: center;
      padding: 0px !important;
  }
  .login_box .btn1,
  .login_box .btn2{
      height: 48px !important;
      font-size: 15px;
  }
  .signup-link{
      text-decoration: none !important ;
  }
  .login_box .btn1{
      width: 100%;
      margin: 70px 0px 15px 0px;
      background-color: #4f3dd8 !important;
      color: white !important;
      font-weight: 700 !important;
      
  }
  .login_box .btn2{
      color : #4f3dd8 !important;
      font-weight: 700 !important;
      background-color: white !important;
      border:solid 2px #4f3dd8;
      box-shadow: none;
  }
  .login_box .v-checkbox{
      background-color: #4f3dd8 !important; 
  }

  .login_box .v-card__title{
      color : #4f3dd8 !important;
      font-weight: bold !important;
  }
  .login-save-rspw-box .v-input__slot{
    box-shadow: none !important;
    padding-left: 10px;
  }
  .login-save-rspw-box{
    margin-top:-25px !important;
  }
  .login_save_box,
  .reset_pw_box{
    width: 50%;
    margin: 0 !important;
    padding: 0 !important;
    text-align: right;
  }
  .login_save_box .v-input--checkbox{
    margin:0 !important;
    font-size: 13px !important;
  }
  .login_save_box label{
    font-size: 16px !important;
    line-height: 3.38;
    color: #493dcf !important;
  }


</style>