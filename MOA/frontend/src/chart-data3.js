
export const barChartData3 = {
    type: "bar",
      data: {
        labels: ["1팀", "2팀", "3팀", "4팀", "5팀", "6팀", "7팀", "8팀", "9팀", "10팀", "11팀", "12팀", "13팀", "14팀", "15팀"],
        datasets: [
          {
            label: "고객 업무 대상",
            data: [12, 39, 3, 35, 2, 23, 20, 30, 22, 44, 10, 6, 18, 11, 28],
            backgroundColor: 
                'rgba(255, 205, 86, 0.5)'
            ,
            borderColor: 
            'rgba(255, 205, 86, 0.5)'
            ,
            borderWidth: 1,
          },
          {
            label: "스탭 업무 대상",
            data: [32, 10, 13, 35, 12, 3, 10, 44, 22, 7, 8, 44, 30, 22, 10],
            backgroundColor: 
                'rgba(75, 192, 192, 0.5)'
            ,
            borderColor: 
                'rgba(75, 192, 192, 0.5)'
            ,
            borderWidth: 1,
          }
        ],
      },
      options: {
        maintainAspectRatio: false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
        scales: {
          yAxes: [
            {
              ticks: {
                beginAtZero: true,
              },
            },
          ],
        },
      },
  };
  
  export default barChartData3;