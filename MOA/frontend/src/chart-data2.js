
export const barChartData2 = {
    type: "bar",
      data: {
        labels: ["고객운영팀", "고객개발1팀", "고객개발2팀", "유통서비스팀", "Rater서비스팀", "빌링운영팀", "빌링개발팀", "PAY서비스팀", "고객DX솔루션팀", "CRM사업팀", "CRM서비스팀", "오픈채널서비스팀", "오픈채널사업TF", "BSS 품질혁신팀", "IT 컨설팅팀"],
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
          xAxes: [{
            gridLines: {
              color: "rgba(0, 0, 0, 0)",
            }  
          }
          ],

          yAxes: [
            {
              ticks: {
                beginAtZero: true,
              },

              gridLines: {
                color: "rgba(0, 0, 0, 0)",
              }   
            },
          ],
        },
        legend: {
          display: false
        }
      },
  };
  
  export default barChartData2;