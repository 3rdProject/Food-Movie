<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Titan | Multipurpose HTML5 Template</title>
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="../assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="../assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="../assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="../assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="../assets/lib/owl.carousel/dist/../assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../assets/lib/owl.carousel/dist/../assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="../assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="../assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="../assets/css/colors/default.css" rel="stylesheet">
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <div class="main">
        <section class="module bg-dark-60 portfolio-page-header" data-background="../assets/images/portfolio/portfolio_header_bg.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Movie Detail</h2>
                <div class="module-subtitle font-serif">Enjoy your Movie</div>
              </div>
            </div>
          </div>
        </section>
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-12">
                <div class="embed-responsive embed-responsive-16by9">
                  <iframe class="embed-responsive-item" src="//www.youtube.com/embed/Jkk0VHiCnKY" frameborder="0" allowfullscreen="allowfullscreen"></iframe>
                </div>
              </div>
            </div>
            <div style="height:50px"></div>
            <div class="col-sm-6 col-md-8 col-lg-8"><img :src="detail_data.poster" alt="Title of Image"/></div>
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="work-details">
                  <h5 class="work-details-title font-alt">{{detail_data.title}}</h5>
                  <!-- <p>{{story}}</p> -->
                  <ul>
                    <li><strong>예매율: </strong><span class="font-serif"><a href="#" target="_blank">{{detail_data.hit}}</a></span>
                    </li>
                    <li><strong>평점: </strong><span class="font-serif"><a href="#" target="_blank">{{detail_data.score}}</a></span>
                    </li>
                    <li><strong>장르: </strong><span class="font-serif"><a href="#" target="_blank">{{detail_data.genre}}</a></span>
                    </li>
                    <li><strong>개봉일: </strong><span class="font-serif"><a href="#" target="_blank">{{detail_data.regdate}}</a></span>
                    </li>
                    <li><strong>러닝타임: </strong><span class="font-serif"><a href="#" target="_blank">{{detail_data.time}}</a></span>
                    </li>
                    <li><strong>감독: </strong><span class="font-serif"><a href="#" target="_blank">{{detail_data.director}}</a></span>
                    </li>
                    <li><strong>출연: </strong><span class="font-serif"><a href="#" target="_blank">{{detail_data.actor}}</a></span>
                    </li>
                    <li><strong>등급: </strong><span class="font-serif"><a href="#" target="_blank">{{detail_data.grade}}</a></span>
                    </li>
                    <li><strong>누적관객: </strong><span class="font-serif"><a href="#" target="_blank">{{detail_data.showuser}}</a></span>
                    </li>
                  </ul>
                </div>
              </div>
          </div>
        </section>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    <script>
    	new Vue({
    		el:'.main',
    		data:{
    			no:${no},
    			detail_data:{}
    		},
    		mounted:function(){
    			axios.get("http://localhost/web/movie/rest_detail.do",{
    				params:{
    					no:this.no
    				}
    			}).then(res=>{
    				console.log(res.data);
    				this.detail_data=res.data;
    			})
    		}/*,
    		methods:{
    			change:function(no){
    				this.no=no;
    				//let _this=this;
    				axios.get("http://localhost/web/movie/rest_detail.do",{
    					params:{
    						no:this.no
    					}
    				}).then(res=>{
    					console.log(res.data);
    					this.detail_data=res.data;
    				})
    			}
    		}*/
    	})
    </script>
</body>
</html>