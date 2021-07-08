
export const barChartData2 = {
    type: "bar",
      data: {
        labels: ["1팀", "2팀", "3팀", "4팀", "5팀", "6팀", "7팀", "8팀", "9팀", "10팀", "11팀", "12팀", "13팀", "14팀", "15팀"],
        datasets: [
          {
            label: "팀별 자동화 건수",
            data: [],
            backgroundColor: [
              "rgba(255, 99, 132, 0.2)",
              "rgba(54, 162, 235, 0.2)",
              "rgba(255, 206, 86, 0.2)",
              "rgba(75, 192, 192, 0.2)",
              "rgba(153, 102, 255, 0.2)",
              "rgba(255, 159, 64, 0.2)",
              "rgba(54, 255, 255, 0.2)",
              "rgba(102, 255, 102, 0.2)",
              "rgba(255, 000, 204, 0.2)",
              "rgba(000, 051, 204, 0.2)",
              "rgba(153, 000, 255, 0.2)",
              "rgba(255, 255, 000, 0.2)",
              "rgba(204, 000, 051, 0.2)",
              "rgba(102, 102, 102, 0.2)",
              "rgba(102, 051, 000, 0.2)",
            ],
            borderColor: [
                "rgba(255, 99, 132, 1)",
                "rgba(54, 162, 235, 1)",
                "rgba(255, 206, 86, 1)",
                "rgba(75, 192, 192, 1)",
                "rgba(153, 102, 255, 1)",
                "rgba(255, 159, 64, 1)",
                "rgba(54, 255, 255, 1)",
                "rgba(102, 255, 102, 1)",
                "rgba(255, 000, 204, 1)",
                "rgba(000, 051, 204, 1)",
                "rgba(153, 000, 255, 1)",
                "rgba(255, 255, 000, 1)",
                "rgba(204, 000, 051, 1)",
                "rgba(102, 102, 102, 1)",
                "rgba(102, 051, 000, 1)",
            ],
            borderWidth: 1,
          },
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
  
  export default barChartData2;