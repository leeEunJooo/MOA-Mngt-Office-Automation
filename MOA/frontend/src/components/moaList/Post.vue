<template>
<div class="posting">
    <div class="post_title">
        <div class="ic_circle" >
            <img src="../../assets/img/folder.png" class="folder_ic"/>
        </div>
        <input class="title" placeholder="자동화 제목을 입력해 주세요"/>
    </div>
    <div class="post_contents">
        <ul>
            <li>
                <div class="sm_title">담당자</div>
                <div>
                    <input class="typing" />
                </div>
            </li>
            <li>
                <div class="sm_title">사용자</div>
                <div>
                    <input class="typing"/>
                    <!-- <v-select
                    :items="team_div_cd"
                    item-text="name"
                    item-value="idx"
                    item-color='#f2f3ff'
                    solo
                    return-object
                  ></v-select> -->
                </div>
            </li>
            <li>
                    <div class="sm_title">진행단계</div>
                    <input disabled>
                </li>
            <li>
                <div class="sm_title">작동시기</div>
                <div>
                    <input class="typing sm_typing"/>
                    <input class="typing sm_typing"/>
                </div>
            </li>
            <li>
                <div class="sm_title">대상시스템</div>
                <div>
                    <input class="typing"/>
                    <!-- <v-select
                    :items="team_div_cd"
                    item-text="name"
                    item-value="idx"
                    item-color='#f2f3ff'
                    solo
                    return-object
                  ></v-select> -->
                </div>
            </li>
            <li>
                <div class="sm_title">사용기술</div>
                <div>
                    <input class="typing"/>
                    <!-- <v-select
                    :items="team_div_cd"
                    item-text="name"
                    item-value="idx"
                    item-color='#f2f3ff'
                    solo
                    return-object
                  ></v-select> -->
                </div>
            </li>
            <li>
                <div class="sm_title">실행방법</div>
                <div>
                    <input class="typing"/>
                </div>
            </li>
            <li>
                <div class="sm_title">실행환경</div>
                <input disabled>
            </li>
            <li>
                <div class="sm_title">Input</div>
                <div>
                    <input class="typing"/>
                </div>
            </li>
            <li>
                <div class="sm_title">Output</div>
                <div>
                    <input class="typing"/>
                </div>
            </li>
            <li>
                <div class="sm_title">실행후결과</div>
                <div>
                    <input class="typing"/>
                </div>
            </li>
            <li>
                <div class="sm_title">Workaround</div>
                <input class="typing"/>
                <!-- <v-select
                    :items="team_div_cd"
                    item-text="name"
                    item-value="idx"
                    item-color='#f2f3ff'
                    solo
                    return-object
                  ></v-select> -->
            </li>
            <li>
                <div class="sm_title">매뉴얼여부</div>
                <div>
                    <input type="checkbox" class="checkbox" name="Y" v-model="checkedY">
                    <label>Y</label>
                    <input type="checkbox" class="checkbox" name="N" v-model="checkedN">
                    <label>N</label>
                </div>
            </li>
            <li class="height_fit_content">
                <div class="sm_title" style="margin-bottom:5px">매뉴얼파일</div>
                <v-btn class="addfilebtn">
                    <img src="../../assets/img/paperclip.png" class=""/>
                </v-btn>
                <!-- 매뉴얼파일 리스트 -->
                <div class="filebox1">
                    <input class="typing file_list" disabled/>
                    <hr class="file_hr"/>
                </div>
            </li>
            <li class="height_fit_content">
                <div class="sm_title" style="margin: 5px 0px">자동화파일</div>
                <v-btn class="addfilebtn">
                    <img src="../../assets/img/paperclip.png" class=""/>
                </v-btn>
                <!-- 자동화파일 리스트 -->
                <div class="filebox2">
                    <input class="typing file_list" disabled/>
                    <hr class="file_hr"/>
                </div>
            </li>
            <li class="height_fit_content" style="margin-top:15px">
                <div class="sm_title" style="margin: 5px 0px">상세설명</div>
                <div class="textarea">
                    <textarea>

                    </textarea>
                </div>
            </li>
            <li class="height_fit_content" style="margin-top:15px">
                <div class="sm_title" style="margin: 5px 0px">실행시주의점</div>
                <div class="textarea">
                    <textarea >
                    </textarea>
                </div>
            </li>
            <li class="height_fit_content" style="margin-top:15px">
                <div class="sm_title" style="margin: 5px 0px">기타사항</div>
                <div class="textarea">
                    <textarea >
                    </textarea>
                </div>
            </li>  
        </ul>

    </div>
    <div class="post_btn">
        <v-btn class="close">취소</v-btn>
        <v-btn class="save">저장</v-btn>
    </div>
</div>
</template>

<script>


export default {
props : {
    Id : Number,
    detailInfo : {},
},

data:()=>({
    team_div_cd: [
        {name: "1팀",idx: "T01", idx2:"D01"},
        {name: "2팀",idx: "T02", idx2:"D01"},
        {name: "3팀",idx: "T03", idx2:"D01"}, 
        {name: "4팀",idx: "T04", idx2:"D01"},
        {name: "5팀",idx: "T05", idx2:"D02"},
        {name: "6팀",idx: "T06", idx2:"D02"}, 
        {name: "7팀",idx: "T07", idx2:"D02"},
        {name: "8팀",idx: "T08", idx2:"D02"},
        {name: "9팀",idx: "T09", idx2:"D03"}, 
        {name: "10팀",idx: "T10", idx2:"D03"}, 
        {name: "11팀",idx: "T11", idx2:"D03"},
        {name: "12팀",idx: "T12", idx2:"D03"},
        {name: "13팀",idx: "T13", idx2:"D03"},
    ],
    checkedY: false,
    checkedN: false
}),
methods:{

},

created() {
    this.getInfo();
    
},
mounted(){
    console.log(this.detailInfo);

}


}
</script>

<style>
.posting{
    margin:40px;
}
.posting .folder_ic{
    width:28px;
    height:22px;
}

.posting .post_title{
    width:100%;
    height:60px;
}
.posting .title{
    padding: 0px 15px;
}
.posting .title:focus{
    outline:none;
}
.posting .typing{
    width: 510px;
    height: 42px;
    padding: 0px 10px;
    border-radius: 6px;
    box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.16);
    background-color: #ffffff;
}
.posting .typing:focus{
    outline: solid 1px #5d51eb;
    border-radius: 6px;
}
.posting .filebox1 .typing,
.posting .filebox2 .typing{
    width: 640px;
    height: 42px;
    padding: 0px 10px;
    border-radius: 6px;
    box-shadow: none;
    background-color: #ffffff;
}
.posting .addfilebtn{
    display: inline-block;
    min-width: 30px !important;
    width: 30px !important;
    height: 30px !important;
    border-radius: 5px;
    /* padding:5px 10px !important; */
    background-color: #d0ffff !important;
    box-shadow: none;
}
.posting .sm_typing:first-child{
    width:200px;
    margin-right: 10px;
}
.posting .sm_typing{
    width:200px;
}
.posting .ic_circle,
.posting .title{
    display: block;
    float: left;
}
.posting .ic_circle{
    width: 55px;
    height: 55px;
    padding: 17px 14px;
    border-radius: 50px;
    background-color: #e5e7fd;
}
.posting .title{
    width: 85%;
    height: 90%;
    margin-left: 20px;
    border-bottom: solid 2.5px #5d51eb;
    font-family: AppleSDGothicNeoEB00;
    font-size: 26px;
    line-height: 1;
    letter-spacing: normal;
    text-align: left;
    color: #5d51eb;
}
    /* post content */
.post_contents ul{
    margin: 50px 15px;
    margin-bottom: 0px;
}
.post_contents ul li{
    width: 100%;
    height: 50px;
    margin-bottom: 5px;
}
.post_contents ul li:nth-last-child(2){
    height: 150px;
    width:100%;
}
.post_contents ul li div{
    display: inline-block;
}
.post_contents ul li .sm_title{
    width:20%;
    font-family: AppleSDGothicNeoB00;
    font-size: 16px;
    font-weight: normal;
    font-stretch: normal;
    font-style: normal;
    line-height: 1.89;
    letter-spacing: normal;
    text-align: left;
    color: #3b3b3b;
}
.post_contents .textarea{
    width: 100%;
    height: 108px;
    margin-top:5px;
    border-radius: 12px;
    background-color: #f2f3ff;
}
.post_contents .textarea textarea{
    width: 100%;
    height: 100% !important;
    padding: 15px;
}
.posting .file_list{
    width: 100%;
    margin: 10px 0px;
} 
.posting .checkbox{
    width: 18px;
    height: 18px;
    margin: 5px;
    border: solid 1px #707070;
    vertical-align: text-bottom;
    background-color: #ffffff;
}
.posting label{
    margin: 5px 10px!important ;
    font-size: 18px;
    text-align: left;
    color: #3b3b3b;
}
.posting .file_hr{
    opacity: 0.2;
    border: solid 0.5px #707070;
    margin-top:5px;
}

.height_fit_content{
    height: fit-content !important;
}
.post_btn .close{
    float: right;
    width: 105px;
    height: 40px !important;
    margin: 30px 20px 50px 0px;
    color: #3b2fcb;
    font-size: 14px;
    border-radius: 24px;
    box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.16);
    border: solid 3px #3b2fcb;
    background: white;
}
.post_btn .save{
    float: right;
    width: 105px;
    height: 40px !important;
    margin: 30px 20px 50px 0px;
    color: white;
    font-size: 14px;
    border-radius: 24px;
    box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.16);
    border: solid 3px #3a2fca;
    background-color: #3b2fcb !important;
}
/* 선택박스 */

</style>