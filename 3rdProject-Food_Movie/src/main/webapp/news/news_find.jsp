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
                <h2 class="module-title font-alt">News</h2>
                <div class="module-subtitle font-serif">Today's News</div>
              </div>
            </div>
          </div>
        </section>
        <section class="module">
          <div class="container">
            <div class="row mb-60">
              <div class="col-sm-8 col-sm-offset-2">
                <!-- <form role="form"> -->
                  <div class="search-box">
                    <input class="form-control" type="text" placeholder="영화" v-model="ss">
                    <button class="search-btn" v-on:click="newsFind()"><i class="fa fa-search"></i></button>
                  </div>
               <!--  </form> -->
              </div>
            </div>
			    <div class="row">
			      <table class="table" v-for="vo in news_data">
			        <tr>
			      	    <td width=30% class="text-center" rowspan="3">
			      	      <img :src="vo.poster" style="width=300px;height=150px">
			      	    </td>
			      	</tr>
			        <tr>
			          <th colspan="2">{{vo.title}}</th>
			        </tr>
			        <tr>
			          <td colspan="2"><a :href="vo.link">{{vo.desc}}</a></td>
			        </tr>
			        <tr>
			          <td class="text-left">{{vo.date}}</td>
			          <td class="text-right">{{vo.author}}</td>
			        </tr>
			      </table>
			    </div>
              </div>
          </section>
       </div>
   </main>
     <script>
    new Vue({
    	el:'.main',
    	data:{
    		ss:'영화',
    		news_data:[]
    	},
    	mounted:function(){ 
    		axios.get("http://localhost/web/news/rest_news_find.do",{
    			params:{
    				ss:this.ss
    			}
    		}).then(res=>{
    			this.news_data=res.data
    		})
    		console.log("mounted Call... (브라우저에서 HTML을 출력 완료 : 한번만 호출된다)")
    	},
    	updated:function(){ 
    		console.log("updated Call... (검색어 변경) ss="+this.ss+"갱신되서 화면변경");
    	},
    	methods:{
    		newsFind:function(){
	    		axios.get("http://localhost/web/news/rest_news_find.do",{
	    			params:{
	    				ss:this.ss
	    			}
	    		}).then(res=>{
	    			this.news_data=res.data
	    		})
    		}
    	}
    })
  </script>
</body>
</html>