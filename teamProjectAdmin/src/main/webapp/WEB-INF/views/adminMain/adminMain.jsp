<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>
	<!-- Content Row -->
          <div class="row">

            <div class="col-xl-8 col-lg-7">

              <!-- Area Chart -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">매출그래프</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                  </div>
                 
                </div>
              </div>

              <!-- Bar Chart -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">베스트셀러 Top7</h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myBarChart"></canvas>
                  </div>
                </div>
              </div>

            </div>

            
            <div class="col-xl-4 col-lg-5">
            
            <!-- 회원 남.녀 성 비율Donut Chart -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">회원 성 비율</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myPieChart"></canvas>
                  </div>
                </div>
              </div>
          
            
            <!-- Content Column -->
              <div class="card shadow mb-4">
			 <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">이용원 구매 추이</h6>
				</div>
				<div class="card-body">
					 <div class="chart-bar">
								<canvas id="myChart"></canvas>
							</div>
				</div>
			</div>
			  </div>
          </div>
	

	
	<!-- Page level plugins -->
	<script
		src="/app/resourse/vendor/chart.js/Chart.min.js"></script>
	  <script
		src="/app/resourse/vendor/chart.js/bestChart.js"></script>
		
<script src="/app/resourse/vendor/chart.js/genderChart.js"></script>
<script src="/app/resourse/vendor/chart.js/ticketChart.js"></script>
<script src="/app/resourse/vendor/chart.js/moneyChart.js"></script>
</body>

</html>