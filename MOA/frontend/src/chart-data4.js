export const barChartData4 = {
    type: "doughnut",
      data: {
        labels: [
          '팀',
          '대상시스템',
          '수행시간',
          '사용기술',
          '자동화 명칭',
          '매뉴얼',
          '전체검색'
        ],
        datasets: [
          {
            label: "고객 업무 대상",
            data: [300, 50, 100, 20, 70, 200, 100],
            backgroundColor: [
              'rgba(255, 99, 132, 0.9)',
              'rgba(255, 159, 64, 0.9)',
              'rgba(255, 205, 86, 0.9)',
              'rgba(75, 192, 192, 0.9)',
              'rgba(54, 162, 235, 0.9)',
              'rgba(153, 102, 255, 0.9)',
              'rgba(201, 203, 207, 0.9)'
            ],

            hoverOffset: 7
          }
        ],
      },
      options: {
        maintainAspectRatio: false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
        
      },
  };
  
  export default barChartData4;