<template>
  <div class="moalist">


      <div class ="title-section"> MOA List </div>


      <div class="list-btn-row-box">
            <v-select
                v-model="search_select"
                class="search_box1"
                :items="items"
                item-text="name"
                item-value="code"
                label="검색기준"
                solo
                return-object
            ></v-select>

            <v-text-field
                v-model="search_text"
                class="search_box2"
                label="1팀"
                placeholder="1팀"
                solo
            ></v-text-field>

            <v-btn
                v-on:click="search"
                class="search_btn"
                height="32px">
                Search
            </v-btn>
            <v-btn
                v-on:click="addfile"
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
  </div>
</template>

<script>
import dayjs from 'dayjs'

export default {
  //스텝별, 업무별
   component: {
      dayjs
    },

    data: function(){
      return { 
        // FIRST_REG_DATE.getFullYear() + "-" + (FIRST_REG_DATE.getMonth() + 1) + "-" + FIRST_REG_DATE.getDate()}
        moa_list:[],
        moa_list2:[], 
        date:"",
        items: [
          // '팀', '담당자', '대상시스템', '수행시간', '사용기술', '자동화 명칭', '매뉴얼', '전체검색'],
          {name: "팀", code: "TDC"},
          {name: "담당자", code: "ETC1"},
          {name: "대상시스템", code: "SYD"},
          {name: "수행시간", code: "CDC"},
          {name: "사용기술", code: "LDC"},
          {name: "자동화 명칭", code: "ETC2"},
          {name: "전체검색", code: "ETC3"},
        ],
        headers: [
          { text: '자동화파일', value: 'NTCART_TITLE_NM' },
          { text: '작성자', value: 'TKCGR_NM' },
          { text: '업로드일', value: 'FIRST_REG_DATE'},
          { text: '최근수행시간', value: 'EXE_DATE' },
          { text: '', value: 'exe_btn' }
        ],
        search_select: '',
        search_text: '',
        exe_btn:'s',
      };
    },

    created() {
      this.$http.get("/api/mlist/selectList")
      .then((response) => {
        // console.log("asdasd"+response);
        this.moa_list = response.data;
        // console.log(this.moa_list);
        
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
        let routeData = this.$router.resolve({
          name: 'listdetail',
          params: {id: items.FILE_SEQ}
         });

          
        window.open(routeData.href, "_blank","width=680, height=850, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
          
          // 모달창 만들기
          //거기로 데이터 넘겨주기
      },
      
      search: function(){
        this.moa_list = [];
        this.moa_list2 = [];
        // if(this.search_select == "대상시스템") this.search_select = "S01";
        console.log("!!!!!!!!!!!!!!!!!!!!!", this.search_select);
        console.log("@@@@@@@@@@@@@@@@@@@@@", this.search_text);
        this.$http.post("/api/mlist/search",{
          search_select:this.search_select,
          search_text:this.search_text,
        })
        .then(
          (response)=>{
            console.log("#################", response);
            
            console.log("response.data", response.data);
            console.log("response.data", response.data.length);

            if (Object.keys(response.data).includes('row1') && Object.keys(response.data).includes('row2')) {
              if (response.data.row1.length == 0 && response.data.row2.length == 0) {
                alert("검색한 단어는 존재하지 않습니다.");
                this.moa_list=[];
              } else {
                console.log("둘 다 포함");
                console.log("response.data.data1 : ", response.data.row1);
                console.log("response.data.data2 : ", response.data.row2);
                console.log("response.data.data1 길이 : ", response.data.row1.length);
                console.log("response.data.data2 길이 : ", response.data.row2.length);
              
                for(let i = 0; i < response.data.row1.length; i++) {
                  this.moa_list.push(response.data.row1[i]);
                  this.moa_list2.push(response.data.row1[i]);
                }

                console.log("moa_list21 : ", this.moa_list2);

                for (let i = 0; i < this.moa_list2.length; i++) {
                  for(let j = 0; j < response.data.row2.length; j++) {
                    if ((this.moa_list2[i].NTCART_TITLE_NM != response.data.row2[j].NTCART_TITLE_NM) && (this.moa_list2[i].TKCGR_NM != response.data.row2[j].TKCGR_NM)) {
                      this.moa_list.push(response.data.row2[j]);
                    }                  
                  }
                }
              
                console.log("moa_list : ", this.moa_list);

                for(let i = 0; i < this.moa_list.length; i++) {
                  this.moa_list[i].FIRST_REG_DATE = dayjs(this.moa_list[i].FIRST_REG_DATE).format('YYYY-MM-DD');
                  if(this.moa_list[i].EXE_DATE != '0000-00-00 00:00:00'){
                    this.moa_list[i].EXE_DATE = dayjs(this.moa_list[i].EXE_DATE).format('YYYY-MM-DD HH:mm:ss');
                  }
                }
              }
            } else {
              if (response.data.length == 0) {
                alert("검색한 단어는 존재하지 않습니다.");
                this.moa_list=[];
              } else {
                console.log("코드성 제외");
                console.log("response.data : ", response.data);
                console.log("response.data 길이 : ", response.data.length);
                this.moa_list = response.data;
                console.log("moa_list : ", this.moa_list);

                for(let i = 0; i < this.moa_list.length; i++) {
                this.moa_list[i].FIRST_REG_DATE = dayjs(this.moa_list[i].FIRST_REG_DATE).format('YYYY-MM-DD');
                // console.log(this.moa_list[i].EXE_DATE);
                  if(this.moa_list[i].EXE_DATE != '0000-00-00 00:00:00'){
                    this.moa_list[i].EXE_DATE = dayjs(this.moa_list[i].EXE_DATE).format('YYYY-MM-DD HH:mm:ss');
                  }
                // console.log(this.moa_list[i].EXE_DATE);
                }
              }
            }
          }
        )
      },

      addfile: function(){
        let routeData = this.$router.resolve({
                                              name: 'posting',
                                            });
        window.open(routeData.href, "_blank","width=700, height=850, toolbar=no, menubar=no, scrollbars=no, resizable=yes");

    }
      
    },

    
    
  }
</script>

<style>
.v-text-field.v-text-field--solo:not(.v-text-field--solo-flat) > .v-input__control > .v-input__slot{
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16) !important;
}
.moalist{
  width:100%;
  padding:70px 70px 0px 70px;
  height: fit-content;
}
.moalist .title-section{
    width:100%;
    height:fit-content !important;
    font-family: GmarketSansBold !important;
    font-size: 27px !important;
    font-weight: bold;
    line-height: 0.14;
    letter-spacing: 0.04px;
    text-align: left;
    color: #575757;
}
.font_title{
    font-size: 26px !important;
    font-weight: bold !important;
}
.list-btn-row-box{
  margin-top:60px;
  width:100%;
}
.moalist .v-input__slot{
  min-height: 0px !important;
  height: 40px;
}
.list-btn-row-box .search_box1,
.list-btn-row-box .search_box2,
.list-btn-row-box .search_btn,
.list-btn-row-box .addfile_btn{
  display: inline-block;
  
}
.list-btn-row-box .search_box1{
  width: 160px !important;
  height: 45px !important;
}
.list-btn-row-box .search_box2{
    width: 30%;
    margin: 0px 10px;
}
.list-btn-row-box .search_btn{
    width: 90px !important;
    height: 40px !important;
    background-color: #f0217b !important;
    color : white !important;
    padding: 10px 15px !important;
    border-radius: 5px;
    box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16);
    
}
.list-btn-row-box .addfile_btn{
    width: 90px !important;
    height: 40px !important;
    background-color: #5244f5 !important;
    color : white !important;
    float:right;
    padding: 5px 15px !important;
    border-radius: 5px;
    box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16);
}
.v-input__slot{
  min-height: 45% !important;
}
.data_table{
  text-align: center;
}
.data_table span{
  font-size: 14px;
  color: rgb(52, 52, 52);
  font-weight: bold;
}


</style>