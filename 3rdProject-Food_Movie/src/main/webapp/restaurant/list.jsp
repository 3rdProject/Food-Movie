<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <link href="../assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="../assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="../assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="../assets/css/colors/default.css" rel="stylesheet">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
  <main>
    <section class="home-section home-full-height" id="home">
      <div class="hero-slider">
        <ul class="slides">
          <li class="bg-dark-30 restaurant-page-header bg-dark" style="background-image:url(&quot;../assets/images/restaurant/slider3.jpg&quot;);">
            <div class="titan-caption">
              <div class="caption-content">
                <div class="font-alt mb-30 titan-title-size-1"> Take a look at</div>
                <div class="font-alt mb-40 titan-title-size-3">Restaurants</div><a class="section-scroll btn btn-border-w btn-round" href="#specialities">Learn More</a>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </section>
    <div class="main">
      <section class="module" id="specialities">
        <div class="container">
          <div class="row">
            <div class="col-sm-2 col-sm-offset-5">
              <div class="alt-module-subtitle"><span class="holder-w"></span>
                <h5 class="font-serif">Take a look at</h5><span class="holder-w"></span>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
              <h2 class="module-title font-alt">Restaurants</h2>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
              <div class="text-center">
                <button class="btn btn-g btn-circle" v-on:click="change(1)">Submit</button>&nbsp;
                <button class="btn btn-d btn-circle" v-on:click="change(2)">Submit</button>&nbsp;
              </div>
            </div>
          </div>
          <hr>
          <div class="row multi-columns-row">
            <div class="col-sm-6 col-md-3 col-lg-3" v-for="vo in cate_data">
              <div class="content-box">
                <div class="content-box-image">
                  <a :href="'../restaurant/detail.do?no='+vo.no">
                    <img :src="vo.poster" :title="vo.rname">
                    <div class="caption">
                      <p>{{vo.rname}}</p>
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>  
      </section>
    </div>
  </main>
  <script>
  new Vue({
  	el:'.main',
  	data:{
  		rno:1,
  		cate_data:[]
  	},
  	mounted:function(){
  		axios.get("http://localhost:8080/web/restaurant/rest_list.do",{
  			params:{
  				rno:this.rno
  			}
  		}).then(response=>{
  			console.log(response.data);
  			this.cate_data=response.data;
  		})
  	},
  	methods:{
  		change:function(rno){
  			this.rno=rno;
  			axios.get("http://localhost:8080/web/restaurant/rest_list.do",{
  				params:{
  					rno:this.rno
  					
  				}
  			}).then(response=>{
  				console.log(response.data);
  				this.cate_data=response.data;

  			})
  		}
  	}
  })
  </script>
</body>
</html>