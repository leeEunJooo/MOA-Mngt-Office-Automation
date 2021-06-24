<template>
  <div>

    <v-container>
      <br>
      <br>


      <div class ="font_title"> MOA List </div>

      <br>
      <br>

      <v-row>
        <v-col cols="6">
          <v-row>
            &nbsp;&nbsp;&nbsp;
            <v-select
                    class="search_box1"
                    :items="items"
                    label="검색기준"
                    solo
                ></v-select>

                &nbsp;

                <v-text-field
                    class="search_box2"
                    label="%1팀%"
                    placeholder="%1팀%"
                    solo
                ></v-text-field>

                &nbsp;

                <v-btn
                    class="search_btn"
                    height="32px">
                    Search
                </v-btn>
              </v-row>
        </v-col>

        <v-col cols="6">
          <v-row>
            <v-btn
                class="addfile_btn"
                height="32px">
                Add File
            </v-btn> 
            
        </v-row>
<!-- 
        v-data-table에서는 3가지 prop를 사용
        :headers = 필드명을 지정하는 prop로 text,align,sortable, value로 구분. value의 경우는 향후 data를 적용시 데이터 내 DTO와 일치시키면 된다.
        :items = API로 받아온 결과 list가 저장되는 장소
        :items-per-page = 한 page에서 보여줄 list의 개 수. -->

        <v-data-table
            :headers="headers"
            :items="moa_list"
            :items-per-page="5"
            class="elevation-1"
        >      
        </v-data-table>
        

    </v-col>
  </div>
</template>

<script>
import dayjs from 'dayjs'

export default {
   component: {
      dayjs
    },

    data: function(){
      return { 
        // FIRST_REG_DATE.getFullYear() + "-" + (FIRST_REG_DATE.getMonth() + 1) + "-" + FIRST_REG_DATE.getDate()}
        moa_list:[], 
        date:"",
        items: ['팀', '담당자', '대상시스템', '수행시간', '사용기술', '자동화 명칭', '매뉴얼', '전체검색'],
        headers: [
          { text: '자동화파일', value: 'NTCART_TITLE_NM' },
          { text: '작성자', value: 'TKCGR_NM' },
          { text: '업로드일', value: 'FIRST_REG_DATE'},
          { text: '최근수행시간', value: 'FIRST_REG_DATE' },
        ],
      };
    },
    created() {
    this.$http.get("/api/mlist/selectList")
    .then((response) => {
      console.log(response);
      this.moa_list = response.data;
      console.log(this.moa_list);
      for(let i = 0; i < this.moa_list.length; i++) {
        this.moa_list[i].FIRST_REG_DATE = dayjs(this.moa_list[i].FIRST_REG_DATE).format('YYYY-MM-DD');
      }
      });
    },

    // methods: {
    //   search: function(){
    //     this.$$http.post("api/mlist/search",{
    //       list:this.list,
    //     })
    //     .then(
    //       (res)=>{

    //       }
    //     )
    //   }
    // },

  }
</script>

<style>
.font_title{
    font-size: 26px !important;
    font-weight: bold !important;
}
.search_box1{
    width: 3%;
}
.search_box2{
    width: 30%;
}
.search_btn{
    width: 15%;
    background-color: #f54479 !important;
    color : white !important
}
.addfile_btn{
    width: 6%;
    background-color: #5244f5 !important;
    color : white !important;
    position: absolute;
    right: 52px;
}
.v-input__slot{
  min-height: 45% !important;
}
</style>