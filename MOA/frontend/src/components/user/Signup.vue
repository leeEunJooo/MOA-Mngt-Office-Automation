<template>
  <div class="signup">
      <div class="header">
        <img src="../../assets/img/signup_ic.png" class="signup-number">
        <span>기본 정보</span>
      </div>
      <div class="content">
          <v-row>
            <div style="padding-left : 10px">
                팀
            </div>

            <div style="padding-left : 230px">
                아이디
            </div>
        </v-row>

        <br>
        <br>

        <v-row>
           
           <div>
                <v-select
                    :items="items"
                    label="팀"
                    solo
                ></v-select>
            </div>

            <div style = "padding-left : 30px">
                <v-text-field
                        label="아이디를 입력해주세요"
                        placeholder="Placeholder"
                        solo
                ></v-text-field>
            </div>
        </v-row>
      </div>
      
  </div>
</template>

<script>
export default {

}
</script>

<style>
.signup{
    width: 1000px;
    height: 700px;
    margin: 55px auto;
    box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
    background-color: #ffffff;
}
.signup-number{
    width: 32px;
    height: 32px;
    margin: 45px 20px 0px 45px;
    object-fit: contain;
}
.signup > .header{
    width:100%;
    height: 80px;
}
.signup > .header > span{ 
    font-size: 30px;
    color: #493dcf;
}
.signup > .content{
    width:100%;
    height: 620px;
    padding:0px 47px;
    padding-top:70px;
}

</style>