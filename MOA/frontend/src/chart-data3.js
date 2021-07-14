
export const barChartData3 = {
    type: "bar",
      data: {
        labels: ["1팀", "2팀", "3팀", "4팀", "5팀", "6팀", "7팀", "8팀", "9팀", "10팀", "11팀", "12팀", "13팀", "14팀", "15팀"],
        datasets: [
          {
            label: "고객업무대상",
            data: [],
            backgroundColor: 
                'rgba(255, 205, 86, 0.5)'
            ,
            borderColor: 
            'rgba(255, 205, 86, 0.5)'
            ,
            borderWidth: 1,
          },
          {
            label: "스탭업무대상",
            data: [],
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