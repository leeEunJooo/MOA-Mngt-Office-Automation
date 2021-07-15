<template>
  <div class="signup">
      <div class="header">
        <img src="../../assets/img/signup_ic.png" class="signup-number">
        <span>회원 가입</span>
        <!-- {{this.default_team}} -->
      </div>
      <div class="content" >
          
          <v-col class="lf-content">
              <div>
                  <span class="ct-combo-title">이름</span>
                  <input placeholder="이름을 입력하세요" class="signup_nm" v-model="user.user_nm"/>
              </div>

              <div>
                  <span class="ct-combo-title">전화번호</span>
                  <input placeholder="01012345678" class="signup_ph" @:keyup="inputPhoneNumber(this);" maxlength="13" v-model="user.user_tel_no" />
              </div>

              <div>
                  <span class="ct-combo-title">팀</span>
                  <v-select
                    v-model="user.default_team"
                    :items="team_div_cd"
                    item-text="name"
                    item-value="idx"
                    item-color='#f2f3ff'
                    solo
                    return-object
                  ></v-select>
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
                    완료
                </button>
              <!-- </router-link> -->
          </v-col>
      </div>
  </div>
</template>

<script>

export default {
    
    methods: {
        signUp: function () {
        this.$http
        .post("/api/musers/signUp", {
            user: this.user
            })
            .then((res) => {
                console.log(res);
                if (res.data.success == true) {
                    alert(res.data.message);
                    localStorage.setItem('token', JSON.stringify(res.data.token));
                    localStorage.setItem('loginUser', JSON.stringify(res.data));
                    console.log(res.data);
                    this.$store.commit('loginToken', {token:JSON.stringify(res.data.token), user_nm:this.user.user_nm});
                    this.$router.push("/moalist"); 
                }
                if (res.data.success == false) {
                    alert(res.data.message);
                }
            })
            .catch(function () {
            alert("error");
            });
        },
    },
    
    data:() => ({
    user: {
        user_tel_no:"",
        user_nm:"",
        user_id:"",
        user_pwd:"",
        default_team: ""
    },
    team_div_cd: [
        {name: "고객운영팀",idx: "T01", idx2:"D01"},
        {name: "고객개발1팀",idx: "T02", idx2:"D01"},
        {name: "고객개발2팀",idx: "T03", idx2:"D01"}, 
        {name: "유통서비스팀",idx: "T04", idx2:"D01"},
        {name: "Rater서비스팀",idx: "T05", idx2:"D02"},
        {name: "빌링운영팀",idx: "T06", idx2:"D02"}, 
        {name: "빌링개발팀",idx: "T07", idx2:"D02"},
        {name: "PAY서비스팀",idx: "T08", idx2:"D02"},
        {name: "고객DX솔루션팀",idx: "T09", idx2:"D03"}, 
        {name: "CRM사업팀",idx: "T10", idx2:"D03"}, 
        {name: "CRM서비스팀",idx: "T11", idx2:"D03"},
        {name: "오픈채널서비스팀",idx: "T12", idx2:"D03"},
        {name: "오픈채널사업TF",idx: "T13", idx2:"D03"},
        {name: "BSS 품질혁신팀",idx: "T14", idx2:"D03"},
        {name: "IT 컨설팅팀",idx: "T15", idx2:"D03"},
    ]
    }),

    
    
    
    
}
</script>

<style>
    .header{
        text-align: left;
        height: 32px;
    }
    .signup{
        width: 930px;
        height: 620px;
        padding:50px;
        margin: 90px auto !important;
        box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
        background-color: #ffffff;
    }
    .ct-combo-title{
        display: block;
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
    .lf-content .v-select__selections{
        padding-left: 10px !important;
    }
    .lf-content .v-text-field{
        padding:0 !important;
    }
    .rt-content {
        margin-top:30px;
        padding-left: 35px;
    }
    .signup_nm,
    .signup_ph,
    .signup_pw,
    .signup_id,
    .signup_nm{
        width: 320px;
        height: 48px;
        margin-top:12px;
        padding: 9px 48px 9px 14px;
        border-radius: 6px;
        box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.16);
        background-color: #ffffff;
    }
    .lf-content > div:nth-child(2),
    .lf-content > div:nth-child(3){
        margin-top:50px;
    }
    .rt-content div:nth-child(2) {
        margin-top:50px;
    }
    .v-input__control:focus,
    .signup_nm:focus,
    .signup_ph:focus,
    .signup_pw:focus,
    .signup_id:focus,
    .signup_nm:focus{
        border: solid 1px #493dcf;
        outline: #493dcf;
    }
    /*콤보박스*/
    .signup .v-input__slot{
        width: 320px !important;
        height: 48px !important;
        border-radius: 6px;
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
        margin: 135px 10px 100px 100px;
        font-weight: 700;
        text-align: center;
        border-radius: 5px;
        border: solid 1px #493dcf;
        background-color: #493dcf;
    }

</style>