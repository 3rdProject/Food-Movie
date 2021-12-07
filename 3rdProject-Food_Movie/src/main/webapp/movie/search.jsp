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
        <section class="module bg-dark-60 blog-page-header" data-background="../assets/images/blog_bg.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Search Movie</h2>
                <div class="module-subtitle font-serif">Find your Movie</div>
              </div>
            </div>
          </div>
        </section>
        <section class="module">
          <div class="container">
            <div class="row mb-60">
                <!-- <form method="get" action="../movie/search.do" role="form"> -->
              <div class="col-sm-8 col-sm-offset-2">
                  <div class="search-box">
                    <input class="form-control" type="text" placeholder="검색어를 입력하세요" v-model="ss">
                    <button class="search-btn" type="submit" v-on:click="movieFind()"><i class="fa fa-search"></i></button>
                  </div>
              </div>
              <!-- </form> -->
            </div>
            <p class="board_total">총<strong id="pageCount">&nbsp;{{total }}</strong>개의 영화가 있습니다.</p>
            <div style="height:30px"></div>
            <div class="row post-masonry post-columns">
              <div class="col-sm-6 col-md-4 col-lg-4" v-for="vo in find_data">
                <div class="post">
                  <div class="post-thumbnail"><a href="'../movie/detail.do?no='+vo.mno"><img :src="vo.poster"  style="height:300px;width:200px" alt="Blog-post Thumbnail"></a></div>
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="'../movie/detail.do?no='+vo.mno">{{vo.title}}</a></h2>
                    <div class="post-meta">By&nbsp;<a href="#">{{vo.director}}</a>&nbsp;| {{vo.regdate}} | {{vo.grade}}
                    </div>
                  </div>
                  <div class="post-entry">
                    <p>{{vo.actor}}</p>
                  </div>
                  <div class="post-more"><a class="more-link" href="'../movie/detail.do?no='+vo.mno">Read more</a></div>
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
  			find_data:[],
  			total:'',
  			ss:''
  		},
  		mounted:function(){
  			axios.get("http://localhost/web/movie/rest_search.do",{
  				params:{
  					ss:this.ss
  				}
  			}).then(res=>{
  				console.log(res);
  				this.find_data=res.data;
  				this.total=this.find_data[0].total;
  			})
  		},
  		methods:{
  			movieFind:function(){
  				axios.get("http://localhost/web/movie/rest_search.do",{
  					params:{
  						ss:this.ss
  					}
  				}).then(res=>{
  					console.log(res);
  					this.find_data=res.data;
  					this.total=this.find_data[0].total;
  				})
  			}
  		}
  	})
  </script>
</body>
</html>