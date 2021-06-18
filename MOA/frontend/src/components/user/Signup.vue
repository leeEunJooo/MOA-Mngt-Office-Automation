<template>
  <div class="signup">
      <div class="header">
        <img src="../../assets/img/signup_ic.png" class="signup-number">
        <span>회원가입</span>
      </div>
      <div class="content">
          
          <v-col class="lf-content">
              <!-- <div>
                  <span class="ct-combo-title">팀</span>
                  <v-combobox 
                    v-model="team"
                    :items="teamitems"
                    dense solo 
                    class="signup_tm">
                  </v-combobox>
              </div> -->
              <div>
                  <span class="ct-combo-title">전화번호</span>
                  <input placeholder="01012345678" class="signup_ph" v-model="user.user_tel_no" />
              </div>
              <div>
                  <span class="ct-combo-title">이름</span>
                  <input placeholder="이름을 입력하세요" class="signup_nm" v-model="user.user_nm" />
              </div>  
          </v-col>
          <v-col class="rt-content">
              <div>
                  <span class="ct-combo-title">아이디</span>
                  <input placeholder="아이디를 입력하세요" class="signup_id" v-model="user.user_id" />
              </div>
              <div>
                  <span class="ct-combo-title">비밀번호</span>
                  <input placeholder="비밀번호" type="password" class="signup_pw" v-model="user.user_pwd" />
                  <!-- <input placeholder="비밀번호 확인" type="password" class="signup_pw"/> -->
              </div>

              <!-- <router-link to="/"> -->
                <button v-on:click="signUp" class="signup_cplt">
                    가입
                </button>
              <!-- </router-link> -->
          </v-col>
      </div>
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
            this.$router.push("/");
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
    data () {
      return {
        user: {
            user_tel_no:"",
            user_nm:"",
            user_id:"",
            user_pwd:"",
        },
        // team: ['1팀'],
        // teamitems: [
        //   '1팀',
        //   '2팀',
        //   '3팀',
        //   '4팀',
        // ],
        items: [
        { header: 'Select an option or create one' },
        {
          text: 'Foo',
          color: 'blue',
        },
        {
          text: 'Bar',
          color: 'red',
        },
      ],
      }
    },
  }
</script>

<style>
    .header{
        text-align: left;
        height: 32px;
    }
    .signup{
        width: 920px;
        height: 580px;
        padding:50px;
        margin: 90px auto !important;
        box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
        background-color: #ffffff;
    }
    .signup-number{
        width: 32px;
        height: 32px;
        display: flexbox;
        object-fit: contain;
    }
    .signup > .header{
        width:100%;
    }
    .signup > .header > span{ 
        font-size: 26px;
        color: #493dcf;
        display: flexbox;
        margin-left: 20px;
    }
    .signup > .content{
        width:100%;
        height: 620px;
        padding:0px 40px;
        padding-top:40px;
    }
    .signup > .v-input__slot {
        align-items: left;
    }
    .v-application .primary--text{
        color:#493dcf;
        cursor: pointer;
    }
    .lf-content, .rt-content{
        width: 50%;
        height: 100%;
        display: inline-table;
        height: 440px;
    }
    .lf-content > div, 
    .rt-content > div{
        display: block;
        align-items: left;
        
    }
    .ct-combo-title{
        display: block;
        text-align: left;
    }
    .rt-content {
        martin-top:30px;
        padding-left: 35px;
    }
    .signup_nm,
    .signup_ph,
    .signup_pw,
    .signup_id{
        width: 320px;
        height: 48px;
        margin-top:12px;
        padding: 9px 48px 9px 14px;
        border-radius: 6px;
        box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.16);
        background-color: #ffffff;
    }
    .lf-content div:nth-child(2){
        margin-top:50px;
    }
    .rt-content div:nth-child(2) {
        margin-top:50px;
    }
    .v-input__control:focus,
    .signup_nm:focus,
    .signup_ph:focus,
    .signup_pw:focus,
    .signup_id:focus{
        border: solid 1px #493dcf;
        outline: #493dcf;
    }
    /*콤보박스*/
    .signup .v-input__slot{
        width: 320px !important;
        height: 48px !important;
        margin-top:0px !important;  
        
    }
    .signup .v-input__control > .v-input__slot{
        box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.16) !important;
    }
    .signup .v-input{
        margin-top:12px !important;
    }
    .signup .v-input__control{
        height: 50px !important;
    }
    /*버튼*/
    .signup_cplt{
        width: 80px;
        height: 45px;
        color:white;
        float: right;
        margin: 70px 10px 100px 100px;
        text-align: center;
        border-radius: 5px;
        border: solid 1px #493dcf;
        background-color: #493dcf;
    }

</style>