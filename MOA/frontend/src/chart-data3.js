
export const barChartData3 = {
    type: "bar",
      data: {
        labels: ["대상", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [
          {
            label: "고객 업무 대상",
            data: [12, 39, 3, 35, 2, 23],
            backgroundColor: 
                'rgba(255, 205, 86, 0.5)'
            ,
            borderWidth: 1,
          },
          {
            label: "스탭 업무 대상",
            data: [32, 10, 13, 35, 12, 3],
            backgroundColor: 
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