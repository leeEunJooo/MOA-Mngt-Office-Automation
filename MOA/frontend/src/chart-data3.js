
export const barChartData3 = {
    type: "bar",
      data: {
        labels: ["고객운영팀", "고객개발1팀", "고객개발2팀", "유통서비스팀", "Rater서비스팀", "빌링운영팀", "빌링개발팀", "PAY서비스팀", "고객DX솔루션팀", "CRM사업팀", "CRM서비스팀", "오픈채널서비스팀", "오픈채널사업TF", "BSS 품질혁신팀", "IT 컨설팅팀"],
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