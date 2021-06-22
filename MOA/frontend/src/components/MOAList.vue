<template>
  <div>
    <v-col style=" padding-left: 45px; padding-right: 45px">
        <div class ="font_title"> MOA List </div>

        <br>
        <br>
   
        <v-row justify-sm>

            <v-select
                class="search_box1"
                :items="items"
                label="검색기준"
                solo
            ></v-select>

            &nbsp;&nbsp; 

            <v-text-field
                class="search_box2"
                label="%1팀%"
                placeholder="%1팀%"
                solo
            ></v-text-field>

            &nbsp;&nbsp; 

            <v-btn
                class="search_btn"
                height="49px">
                Search
            </v-btn>

            <!-- 버튼간의 공간(다시 수정필요)-->
            <div style="padding-left : 500px"></div>


            <v-btn
                class="addfile_btn"
                height="49px">
                Add File
            </v-btn> 
            
        </v-row>

        
        <v-data-table
            :headers="headers"
            :items="desserts"
            :items-per-page="5"
            class="elevation-1"
        ></v-data-table>
        

    </v-col>
  </div>
</template>

<script>
export default {
    data: () => ({
      items: ['팀', '담당자', '대상시스템', '수행시간', '사용기술', '자동화 명칭', '매뉴얼', '전체검색'],

      headers: [
        //   {
        //     text: '자동화파일',
        //     align: 'start',
        //     sortable: false,
        //     value: 'name',
        //   },
          { text: '자동화파일', value: 'calories' },
          { text: '작성자', value: 'calories' },
          { text: '업로드일', value: 'fat' },
          { text: '최근수행시간', value: 'carbs' },
        //   { text: 'Protein (g)', value: 'protein' },
        //   { text: 'Iron (%)', value: 'iron' },
        ],
        desserts: [
          {
            name: 'Frozen Yogurt',
            calories: 159,
            fat: 6.0,
            carbs: 24,
            protein: 4.0,
            iron: '1%',
          },
          {
            name: 'Ice cream sandwich',
            calories: 237,
            fat: 9.0,
            carbs: 37,
            protein: 4.3,
            iron: '1%',
          },
          {
            name: 'Eclair',
            calories: 262,
            fat: 16.0,
            carbs: 23,
            protein: 6.0,
            iron: '7%',
          },
          {
            name: 'Cupcake',
            calories: 305,
            fat: 3.7,
            carbs: 67,
            protein: 4.3,
            iron: '8%',
          },
          {
            name: 'Gingerbread',
            calories: 356,
            fat: 16.0,
            carbs: 49,
            protein: 3.9,
            iron: '16%',
          },
          {
            name: 'Jelly bean',
            calories: 375,
            fat: 0.0,
            carbs: 94,
            protein: 0.0,
            iron: '0%',
          },
          {
            name: 'Lollipop',
            calories: 392,
            fat: 0.2,
            carbs: 98,
            protein: 0,
            iron: '2%',
          },
          {
            name: 'Honeycomb',
            calories: 408,
            fat: 3.2,
            carbs: 87,
            protein: 6.5,
            iron: '45%',
          },
          {
            name: 'Donut',
            calories: 452,
            fat: 25.0,
            carbs: 51,
            protein: 4.9,
            iron: '22%',
          },
          {
            name: 'KitKat',
            calories: 518,
            fat: 26.0,
            carbs: 65,
            protein: 7,
            iron: '6%',
          },
        ],
    }),
  }
</script>

<style>
.font_title{
    font-size: 26px !important;
    font-weight: bold !important;
}
.search_box1{
    width: 10%;
}
.search_box2{
    width: 30%;

}
.search_btn{
    width: 8%;
    background-color: #f54479 !important;
    color : white !important
}
.addfile_btn{
    width: 8%;
    background-color: #5244f5 !important;
    color : white !important
}

</style>