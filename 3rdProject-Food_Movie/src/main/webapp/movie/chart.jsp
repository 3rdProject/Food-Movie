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
                <h2 class="module-title font-alt">Movie Chart</h2>
                <div class="module-subtitle font-serif">Today's Movie Chart</div>
              </div>
            </div>
          </div>
        </section>
        <section class="module">
         <div class="container">
           <div class="row">
          	<div class="text-center">
          		<button class="btn btn-primary btn-circle" v-on:click="movieData(1, '일별 박스오피스')">일별 박스오피스</button>
          		<button class="btn btn-success btn-circle" v-on:click="movieData(2,'실시간 예매율')">실시간 예매율</button>
          		<button class="btn btn-info btn-circle" v-on:click="movieData(3,'좌석 점유율')">좌석 점유율</button>
          		<button class="btn btn-warning btn-circle" v-on:click="movieData(4,'온라인 이용순위')">온라인 이용순위</button>
          	</div>         	
          </div>
	  	<div style="height:50px"></div>
	  	<div class="row">
	  	  <div class="col-md-6">
		      <table class="table">
		        <tr>
		          <th class="text-center"></th>
		          <th class="text-center"></th>
		          <th class="text-center">영화명</th>
		          <th class="text-center">감독</th>
		          <th class="text-center">장르</th>
		        </tr>
		        <tr v-for="vo in movie_data">
		          <td class="text-center">{{vo.rank}}</td>
		          <td class="text-center">
		            <img :src="'https://www.kobis.or.kr'+vo.thumbUrl" width=30 height=30 v-on:mouseover="mouseData(vo.rank)">
		          </td>
		          <td class="text-left"><span :src="'https://www.kobis.or.kr'+vo.thumbUrl" width=30 height=30 v-on:mouseover="mouseData(vo.rank)">{{vo.movieNm}}</span></td>
		          <td class="text-left">{{vo.director}}</td>
		          <td class="text-left">{{vo.genre}}</td>
		        </tr>
		      </table>
		    </div>  
	    	<div class="col-md-6">
		     <!-- 상세보기 -->
		     <table class="table" v-show="isShow">
		       <tr>
		         <td class="text-center" width=30% rowspan="10">
		           <img :src="'https://www.kobis.or.kr'+movie_detail.thumbUrl" width=100%>
		         </td>
		         <td colspan="2">
		           {{movie_detail.movieNm}}<br>
		           <sup>{{movie_detail.movieNmEn}}</sup>
		         </td>
		       </tr>
		       <tr>
		         <td width=20%>개봉일</td>
		         <td width=50%>{{movie_detail.startDate}}</td>
		       </tr>
		       <tr>
		         <td width=20%>제작상태</td>
		         <td width=50%>{{movie_detail.moviePrdtStat}}</td>
		       </tr>
		       <tr>
		         <td width=20%>영화구분</td>
		         <td width=50%>{{movie_detail.movieType}}</td>
		       </tr>
		       <tr>
		         <td width=20%>관람등급</td>
		         <td width=50%>{{movie_detail.watchGradeNm}}</td>
		       </tr>
		       <tr>
		         <td width=20%>상영시간</td>
		         <td width=50%>{{movie_detail.showTm}}</td>
		       </tr>
		       <tr>
		         <td width=20%>제작국가</td>
		         <td width=50%>{{movie_detail.repNationCd}}</td>
		       </tr>
		       <tr>
		         <td width=20%>감독</td>
		         <td width=50%>{{movie_detail.director}}</td>
		       </tr>
		       <tr>
		         <td width=20%>장르</td>
		         <td width=50%>{{movie_detail.genre}}</td>
		       </tr>
		       <tr>
		         <td colspan="3">
		           {{movie_detail.synop}}
		         </td>
		       </tr>
		     </table>
		    </div>
		  </div>
    	</div>
  	</section>
</div>
  <script>
    new Vue({
    	el:'.main',
    	data:{
    		title:'일별 박스오피스',
    		no:1,
    		movie_data:[],
    		movie_detail:{},
    		isShow:false
    	},
    	mounted:function(){
    		this.commonFunc();
    	},
    	methods:{
    		movieData:function(no, title){
    			this.no=no;
    			this.title=title;
    			this.commonFunc();
    		},
    		commonFunc:function(){ 
        		axios.get("http://localhost/web/movie/rest_chart.do",{
        			params:{
        				no:this.no
        			}
        		}).then(res=>{
        			console.log(res.data);
        			this.movie_data=res.data;
        			console.log(this.movie_data[0].thumbUrl);
        		})
    		},
    		mouseData:function(rank){
    			this.isShow=true;
    			console.log("rank="+rank);
    			this.movie_detail=this.movie_data[rank-1];
    		}
    	}
    })
  </script>
    </main>
  </body>
</html>