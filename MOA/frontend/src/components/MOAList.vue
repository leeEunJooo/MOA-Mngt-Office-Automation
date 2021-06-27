<template>
  <div>

    <v-container>

      <div class ="font_title"> MOA List </div>


      <div class="list-btn-row-box">
            <v-select
                v-model="search_select"
                class="search_box1"
                :items="items"
                item-text="name"
                item-value="idx"
                label="검색기준"
                solo
            ></v-select>

            <v-text-field
                v-model="search_text"
                class="search_box2"
                label="%1팀%"
                placeholder="%1팀%"
                solo
            ></v-text-field>

            <v-btn
                v-on:click="search"
                class="search_btn"
                height="32px">
                Search
            </v-btn>
    
            <v-btn
                class="addfile_btn"
                height="32px">
                Add File
            </v-btn> 
      </div>

      <!-- 
        v-data-table에서는 3가지 prop를 사용
        :headers = 필드명을 지정하는 prop로 text,align,sortable, value로 구분. value의 경우는 향후 data를 적용시 데이터 내 DTO와 일치시키면 된다.
        :items = API로 받아온 결과 list가 저장되는 장소
        :items-per-page = 한 page에서 보여줄 list의 개 수. -->

        <v-data-table
            :headers="headers"
            :items="moa_list"
            :items-per-page="5"
            class="data_table"
            @click:row="handleClick"
            
        >      
        </v-data-table>
        
    </v-container>
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
        items: [
          // '팀', '담당자', '대상시스템', '수행시간', '사용기술', '자동화 명칭', '매뉴얼', '전체검색'],
          {name: "팀", idx: "TDC"},
          {name: "담당자", idx: "TKCGR_NM"},
          {name: "대상시스템", idx: "SYD"},
          {name: "수행시간", idx: "CDC"},
          {name: "사용기술", idx: "LDC"},
          {name: "자동화 명칭", idx: "NTCART_TITLE_NM"},
          // {name: "메뉴얼", idx: "ATC_FILE_MANUAL_"}, // 메뉴얼에 무엇을 검색하는지???
          {name: "전체검색", idx: "ALL"},
        ],
        headers: [
          { text: '자동화파일', value: 'NTCART_TITLE_NM' },
          { text: '작성자', value: 'TKCGR_NM' },
          { text: '업로드일', value: 'FIRST_REG_DATE'},
          { text: '최근수행시간', value: 'EXE_DATE' },
        ],
        search_select: '',
        search_text: '',
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
        // console.log(this.moa_list[i].EXE_DATE);
        if(this.moa_list[i].EXE_DATE != '0000-00-00 00:00:00'){
          this.moa_list[i].EXE_DATE = dayjs(this.moa_list[i].EXE_DATE).format('YYYY-MM-DD HH:mm:ss');
        }
        // console.log(this.moa_list[i].EXE_DATE);
      }
      });
    },

    methods: {
      
      handleClick: function(items) {
          // set active row and deselect others
          console.log(items.NTCART_TITLE_NM);
          window.open("http://localhost:3000/#/moalist", "_blank","width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");

          // 모달창 만들기
          //거기로 데이터 넘겨주기
      },
      onClickRedirect: function(){
        window.open("https://google.com", "_blank");
        window.open("https://google.com", "_blank");
      },
      highlightClickedRow: function(value) {
          const tr = value.target.parentNode;
          tr.classList.add('highlight');
      },
      search: function(){
        if(this.search_select == "대상시스템") this.search_select = "SYD";
        console.log("!!!!!!!!!!!!!!!!!!!!!", this.search_select);
        console.log("@@@@@@@@@@@@@@@@@@@@@", this.search_text);
        this.$http.post("/api/mlist/search",{
          search_select:this.search_select,
          search_text:this.search_text,
        })
        .then(
          (response)=>{
            console.log("#################", response);
          }
        )
      }
    },
    
  }
</script>

<style>
.font_title{
    font-size: 26px !important;
    font-weight: bold !important;
}
.list-btn-row-box{
  max-width:1200px;
  margin-top:100px;
}
.list-btn-row-box .search_box1,
.list-btn-row-box .search_box2,
.list-btn-row-box .search_btn,
.list-btn-row-box .addfile_btn{
  display: inline-block;
}
.list-btn-row-box .search_box1{
    width: 10%;
}
.list-btn-row-box .search_box2{
    width: 30%;
    margin: 0px 10px;
}
.list-btn-row-box .search_btn{
    width: 3%;
    background-color: #f54479 !important;
    color : white !important
}
.list-btn-row-box .addfile_btn{
    width: 3%;
    background-color: #5244f5 !important;
    color : white !important;
    float:right;
}
.v-input__slot{
  min-height: 45% !important;
}
.data_table{
  text-align: center;
}
</style>