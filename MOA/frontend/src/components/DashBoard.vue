<template>

  <div class="dashboard">
      <div class="dashboard-content">
        <!--제목-->
        <div class="title-section">DashBoard</div>
        <div class="space"></div>
        <div class = "sub-title"> 자산현황</div>
        <hr class="line1">
        <br>
        
        <!--윗쪽 그래프 2개-->
          <div class="chart-section1">
            <v-row>
              
              <!--담당별 자동화 건수 그래프-->
              <v-col>
                <div class="chart1-title"> [ 담당별 자동화 건수 ]</div>
                
                <div class = "bar-chart1">
                  <canvas id="bar-chart1"></canvas>
                </div>
              </v-col>

              <!--팀별 자동화 건수 그래프-->
              <v-col>
                <div class="chart2-title"> [ 팀별 자동화 건수 ]</div>

                <div class = "bar-chart2">
                  <canvas id="bar-chart2"></canvas>
                </div>
              </v-col>

            </v-row>
          </div>

          <br>
          <hr class="line2">
          <br>
          <br>

        <!--아래쪽 그래프 2개-->
          <div class="chart-section2">
            <v-row>
              
              <!--업무 목적별 팀별 현황 그래프-->
              <v-col>
                <div class="chart3-title"> [ 업무 목적별 팀별 현황 ]</div>
                
                <div class = "bar-chart3">
                  <canvas id="bar-chart3"></canvas>
                </div>
              </v-col>

              <!--기술별 자동화 건수 그래프-->
              <v-col>
                <div class="chart4-title"> [ 기술별 자동화 건수 ]</div>

                <div class = "bar-chart4">
                  <canvas id="bar-chart4"></canvas>
                </div>
              </v-col>

            </v-row>
          </div>

        <br><br><br><br>
        
      </div>
  </div>

</template>

<script>
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
  mounted() {
    const ctx1 = document.getElementById('bar-chart1');
    new Chart(ctx1, this.barChartData1);

    const ctx2 = document.getElementById('bar-chart2');
    new Chart(ctx2, this.barChartData2);

    const ctx3 = document.getElementById('bar-chart3');
    new Chart(ctx3, this.barChartData3);

    const ctx4 = document.getElementById('bar-chart4');
    new Chart(ctx4, this.barChartData4);
  }
}
</script>

<style>
  .dashboard{
    width:100%;
    padding:70px 70px 0px 70px;
    height: fit-content;
  }
  .dashboard .title-section{
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
  .dashboard .sub-title{
    font-size: 18px;
    font-family: GmarketSansBold !important;
    font-weight: bold !important;
    color: black !important;
    padding:0px 0px 3px 10px !important;
  }

  .dashboard .space{
    padding:60px 0px 0px 0px !important;
  }

  .dashboard .line1{
    background-color: #5244f5 !important;
    height: 3px;
  }

  .dashboard .line2{
    background-color: #5244f5 !important;
    height: 2.5px;
    width: 97%;
    margin: auto;
  }

  .dashboard .chart1-title{
    font-size: 13px;
    font-family: GmarketSansBold !important;
    font-weight: bold !important;
    padding:20px 0px 0px 70px !important;
  }

  .dashboard .chart2-title{
    font-size: 13px;
    font-family: GmarketSansBold !important;
    font-weight: bold !important;
    padding:20px 0px 0px 29px !important;
  }

  .dashboard .chart3-title{
    font-size: 13px;
    font-family: GmarketSansBold !important;
    font-weight: bold !important;
    padding:4px 0px 0px 70px !important;
  }

  .dashboard .chart4-title{
    font-size: 13px;
    font-family: GmarketSansBold !important;
    font-weight: bold !important;
    padding:4px 0px 0px 35px !important;
  }

   .dashboard .bar-chart1{
    padding:20px 0px 0px 60px !important;
    width: 80%;
    height: 90%; 
  } 

  .dashboard .bar-chart2{
    padding:10px 0px 0px 20px !important;
    width: 80%;
    height: 90%; 
  } 

  .dashboard .bar-chart3{
    padding:30px 0px 0px 70px !important;
    width: 81%;
    height: 95%; 
  } 

  .dashboard .bar-chart4{
    padding:30px 0px 0px 20px !important;
    width: 81%;
    height: 95%; 
  } 

  .dashboard-content{
    margin : auto;
  }

</style>
