<template>
  <!-- 다이얼로그 -->
  <div class="text-center">
    
    <v-dialog
      v-model="dialog"
      width="510"
    >
    <!--버튼-->
      <template v-slot:activator="{ on, attrs }">
        
        <div
          v-bind="attrs"
          v-on="on"
          class="reset_pw_btn"
        >
          비밀번호 초기화
        </div>
      </template>

      <!--카드 내부-->
      <v-card>

        <!--닫기 버튼-->
        <v-btn
            icon
            navy
            @click="dialog = false"
            class="rs-pw-close"
          >
            <v-icon small color="black" class="rs-pw-close-ic">mdi-close</v-icon>
        </v-btn>
        <!--카드 제목-->
        <v-card-title class="text-h5 rs-pw-cd-title">
          비밀번호 초기화
        </v-card-title>

        
        <!--카드 내용-->
        <v-card-text class="rs-pw-cd-content">
          <!--현재 비밀번호-->
          <div>
              <span class="rs-pw-input-title">아이디</span>
              <input placeholder="아이디 입력" class="cur_user_id" v-model="user.user_id" />
          </div>
          <!--새 비밀번호-->
          <div>
              <span class="rs-pw-input-title">새 비밀번호</span>
              <!-- <v-text-field label="새 비밀번호" type="password" :rules="new_pw1" v-model="user.password" class="reset_new_pw1"></v-text-field>
              <v-text-field label="새 비밀번호 확인" type="password" :rules="new_pw2" class="reset_new_pw2"></v-text-field> -->
              <input placeholder="새 비밀번호" type="password" class="reset_new_pw1" v-model="user.password" />
              <input placeholder="새 비밀번호 확인" type="password"  class="reset_new_pw2"/>
          </div>
        </v-card-text>
    
        <!--확인 버튼-->
        <v-card-actions>
          
          <v-btn
            v-on:click="pwReset"
            text
            @click="dialog = false"
            class="rs-pw-cmplt"
          >
            완료
          </v-btn>
        </v-card-actions>
        
      </v-card>
    </v-dialog>
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
            this.$router.push("/");
          }
          if (res.data.success == false) {
            alert(res.data.message);
            this.$router.push("/");
          }
        })
        .catch(function () {
          alert("error");
        });
    }
  },
  data () {
        return {
          user: {
            user_id:"",
            password:"",
          },
          // new_pw1: [
          //   v => this.state === 'ins' ? !!v || '패스워드는 필수 입력사항입니다.' : true,
          // ],
          // new_pw2: [
          //   v => this.state === 'ins' ? !!v || '패스워드는 필수 입력사항입니다.' : true,
          //   v => v === this.password || '패스워드가 일치하지 않습니다.'
          // ],
          dialog: false,
          notifications: false,
          sound: true,
          widgets: false,
        }
    },
}
</script>

<style>
  /*비밀번호 초기화 버튼*/
  .reset_pw_btn{
    width: 100%;
    font-size: 16px !important;
    text-decoration: underline;
    line-height: 3.38;
    color: #493dcf !important;
  }
  /*카드 내부*/
  .rs-pw-cd-title{
    display: block !important;
    color: #313343 !important;
    font-weight: bold !important;
    text-align: center !important;
    padding-top:70px !important;
  }
  .rs-pw-cd-content{
    width:370px !important;
    margin:auto;
  }
  .rs-pw-input-title{
    width: 98px;
    height: 22px;
    font-size: 14px;
    text-align: left !important;
    color: #3b3b3b;
  }
  .rs-pw-cd-content div:first-child{
    margin-top:50px !important;
  }
  .rs-pw-cd-content div:nth-child(2){
    margin-top:50px !important;
  }
  .cur_user_id,
  .reset_new_pw1,
  .reset_new_pw2{
    display: block;
    width: 100%;
    font-size: 14px;
    height: 48px;
    margin-top:12px;
    padding: 9px 48px 9px 14px;
    border-radius: 6px;
    box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.16);
    background-color: #ffffff;
  }
  .cur_user_id:focus,
  .reset_new_pw1:focus,
  .reset_new_pw2:focus{
    outline: #493dcf;
    border: solid 1px #313343;

  }
  .rs-pw-cmplt{
    width: 190px;
    height: 50px;
    padding: 20px 100px !important;
    border-radius: 50px !important;
    margin: 50px auto 70px auto !important;
    border: solid 3px #313343;
    background-color: #313343;
    color : white !important;
    font-weight: bold;
  }
  .rs-pw-close{
    width: 25px !important;
    height: 25px !important;
    float: right;
    margin: 20px !important;
    background-color: rgba(17, 19, 67, 0.16) !important;
  }

</style>

