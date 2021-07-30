<template>

  <div class="dashboard">
          <div class="chart_section1">
              <div class="graph_bg">
                <div class="chart_title">
                  <img src="../assets/img/chart_ic.png" class="chart_ic"/>
                  <span class="boldft">담당별 자동화 건수</span>
                  </div>
                <div class = "chart">
                  <canvas id="bar-chart1" class = "chartcontent"></canvas>
                </div>
              </div>

              <!--팀별 자동화 건수 그래프-->
              <div class="graph_bg">
                <div class="chart_title"><img src="../assets/img/chart_ic.png" class="chart_ic"/><span class="boldft">팀별 자동화 건수</span> </div>
                <div class = "chart">
                  <canvas id="bar-chart2" class = "chartcontent"></canvas>
                </div>
              </div>
          </div>


          <div class="chart_section2">
              <!--업무 목적별 팀별 현황 그래프-->
              <div class="graph_bg left">
                <div class="chart_title"><img src="../assets/img/chart_ic.png" class="chart_ic"/><span class="boldft">업무 목적별 팀별 현황</span></div>
                <div class = "chart">
                  <canvas id="bar-chart3" class = "chartcontent"></canvas>
                </div>
              </div>

              <!--기술별 자동화 건수 그래프-->
              <div class="graph_bg right">
                <div class="chart_title"><img src="../assets/img/chart_ic.png" class="chart_ic"/><span class="boldft">기술별 자동화 건수</span></div>
                <div class="chart">
                  <canvas id="bar-chart4" class = "chartcontent"></canvas>
                </div>
              </div>

          </div>   


  </div>

</template>
<script>
import '../css/dash.css'
import barChartData1 from '../chart-data1.js'
import barChartData2 from '../chart-data2.js'
import barChartData3 from '../chart-data3.js'
import barChartData4 from '../chart-data4.js'
import Chart from 'chart.js'


export default {
  name: 'Chart',
  data(){
      return{
          barChartData1: barChartData1,
          barChartData2: barChartData2,
          barChartData3: barChartData3,
          barChartData4: barChartData4
      }
  },
  methods: {
    chart1: async function(){
       //담당별 자동화 건수
    this.$http.post("/api/musers/div_cnt")
    .then(
      (res)=>{
        for(var i=0; i<this.barChartData1.data.labels.length; i++){
          let flag = 0;
          for(var j=0; j<res.data.length; j++){
            if(this.barChartData1.data.labels[i] == res.data[j].cd_nm){
              this.barChartData1.data.datasets[0].data.push(res.data[j].upld_cascnt);
              flag =1;
              break;
            }
          }
          if(flag == 0){
            this.barChartData1.data.datasets[0].data.push(0);
          }
        }
        const ctx1 = document.getElementById('bar-chart1');
        new Chart(ctx1, this.barChartData1);
      });
    },
    chart2: async function(){
      //팀별 자동화 건수
    this.$http.post("/api/musers/team_cnt")
      .then(
        (res)=>{
          for(var i=0; i<this.barChartData2.data.labels.length; i++){
            let flag = 0;
            for(var j=0; j<res.data.length; j++){
              if(this.barChartData2.data.labels[i] == res.data[j].cd_nm){
                this.barChartData2.data.datasets[0].data.push(res.data[j].upld_cascnt);
                flag =1;
                break;
              }
            }
            if(flag == 0){
              this.barChartData2.data.datasets[0].data.push(0);
            }
          }
          const ctx2 = document.getElementById('bar-chart2');
          new Chart(ctx2, this.barChartData2);
        });
    },
  
    chart3 : async function(){
      //업무 목적별 팀별 현황
    await this.$http.post("/api/musers/work_prps")
    .then(
      (res)=>{ //team_div_cd, WRKJOB_PRPS_NM
        //labels돌기(1~15팀)
         this.barChartData3.data.datasets[1].data = [];
          this.barChartData3.data.datasets[0].data =[];
        for(var i=0; i<this.barChartData3.data.labels.length; i++){
            let flag = 0;
            // console.log("data.label",this.barChartData3.data.labels[i]);
            //백에서 보내온 데이터만큼 돌기(5개)
            for(var j=0; j<res.data.length; j++){
               //만약 팀이름이 같으면?
              if(this.barChartData3.data.labels[i] == res.data[j].cd_nm){
                //고객업무대상
                if(this.barChartData3.data.datasets[0].label == res.data[j].WRKJOB_PRPS_NM){
                  flag =1;
                  this.barChartData3.data.datasets[0].data.push(res.data[j].cnt);
                }
                //스텝업무대상
                if(this.barChartData3.data.datasets[1].label == res.data[j].WRKJOB_PRPS_NM){
                  if(flag == 1){
                    flag = 3;
                  }else{
                    flag =2;
                  }
                  console.log("스텝업무 대상");
                  this.barChartData3.data.datasets[1].data.push(res.data[j].cnt);
                }
              }
              // console.log("data", res.data[j],this.barChartData3.data.labels[i] );
            }
            // console.log("flag", flag);
            if(flag == 0){
              this.barChartData3.data.datasets[0].data.push(0);
              this.barChartData3.data.datasets[1].data.push(0);
            }else if(flag ==1 || flag == 2){
              if(flag ==1 ){ //고객업무대상일때
                this.barChartData3.data.datasets[1].data.push(0);
              }
              if(flag ==2){ // 스텝업무대상
                this.barChartData3.data.datasets[0].data.push(0);
              }
            }
            const ctx3 = document.getElementById('bar-chart3');
            new Chart(ctx3, this.barChartData3);
            // console.log("data는", this.barChartData3.data.datasets[0], this.barChartData3.data.datasets[1]);
          }
    });
    },
    chart4: async function(){
      //기술별 자동화 건수
    this.$http.post("/api/musers/lang_cnt")
    .then(
      (res)=>{
        console.log("기술별 자동화 건수");
        // console.log(res);  
        this.barChartData4.data.labels=[];
        this.barChartData4.data.datasets[0].data = [];
        for(var j=0; j<res.data.length; j++){
          this.barChartData4.data.labels.push(res.data[j].cd_nm);
          this.barChartData4.data.datasets[0].data.push(res.data[j].upld_cascnt);
        }
        const ctx4 = document.getElementById('bar-chart4');
        new Chart(ctx4, this.barChartData4);
    });
    },
  },
  mounted() {
    this.chart1();
    this.chart2();
    this.chart3();
    this.chart4();
    var menu = document.querySelector('.dashboard_menu').style;
    menu.setProperty('text-decoration','underline');
    menu = document.querySelector('.moalist_menu').style;
    menu.setProperty('text-decoration','none');
  },
 
}


</script>

<style lang="scss">
@import '../css/dash.css';

</style>
