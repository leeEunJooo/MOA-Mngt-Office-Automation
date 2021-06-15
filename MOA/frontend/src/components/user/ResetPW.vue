<template>
  <!-- 다이얼로그 -->
  <div class="text-center">
    
    <v-dialog
      v-model="dialog"
      width="480"
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
              <span class="rs-pw-input-title">현재 비밀번호</span>
              <input placeholder="현재 비밀번호" class="reset_cur_pw"/>
          </div>
          <!--새 비밀번호-->
          <div>
              <span class="rs-pw-input-title">새 비밀번호</span>
              <input placeholder="새 비밀번호" type="password" class="reset_new_pw1"/>
              <input placeholder="새 비밀번호 확인" type="password"  class="reset_new_pw2"/>
          </div>
        </v-card-text>

        <!--확인 버튼-->
        <v-card-actions>
          
          <v-btn
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
  data () {
        return {
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
    padding-top:50px !important;
  }
  .rs-pw-cd-content{
    width:350px !important;
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
  .reset_cur_pw,
  .reset_new_pw1,
  .reset_new_pw2{
    display: block;
    width: 100%;
    font-size: 14px;
    height: 42px;
    margin-top:12px;
    padding: 9px 48px 9px 14px;
    border-radius: 6px;
    box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.16);
    background-color: #ffffff;
  }
  .reset_cur_pw:focus,
  .reset_new_pw1:focus,
  .reset_new_pw2:focus{
    outline: #493dcf;
    border: solid 1px #313343;

  }
  .rs-pw-cmplt{
    width: 190px;
    height: 50px;
    padding: 17px 100px !important;
    border-radius: 50px !important;
    margin: 40px auto 50px auto !important;
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

