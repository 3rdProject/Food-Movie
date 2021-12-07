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
                <h2 class="module-title font-alt">Movie</h2>
                <div class="module-subtitle font-serif">Find your type of Movie</div>
              </div>
            </div>
          </div>
        </section>
        <section class="module">
         <div class="container">
           <div class="row">
          	<div class="text-center">
          		<button class="btn btn-g btn-round" v-on:click="change(1)"><i class="fa fa-video-camera"></i>상영영화</button>
          		<button class="btn btn-d btn-round" v-on:click="change(2)"><i class="fa fa-play-circle"></i>개봉예정영화</button>
          	</div>         	
          </div>
          <div style="height:50px"></div>
             <div class="row post-masonry post-columns">
              <div class="col-sm-6 col-md-4 col-lg-4" v-for="vo in m_data">
                <div class="post">
                  <div class="post-thumbnail"><a :href="'../movie/detail.do?no='+vo.mno"><img :src="vo.poster" alt="Blog-post Thumbnail" style="height:300px;width:200px"></a></div>
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a :href="'../movie/detail.do?no='+vo.mno">{{vo.title}}</a></h2>
                    <div class="post-meta">By&nbsp;{{vo.director}}&nbsp;| {{vo.regdate}} | {{vo.grade}}
                    </div>
                  </div>
                  <div class="post-entry">
                    <p>{{vo.actor}}</p>
                  </div>
                  <div class="post-more"><a class="more-link" :href="'../movie/detail.do?no='+vo.mno">Read more</a></div>
                </div>
              </div>
            </div>
          </div>
			   <div class="row">
			     <div class="text-center">
			       <button class="btn btn-sm btn-danger" v-on:click="prev()">이전</button>
			       <%-- onclick  v-on:mouseover="" v-on:change="" --%>
			         {{curpage}} page / {{totalpage}} pages
			       <button class="btn btn-sm btn-danger" v-on:click="next()">다음</button>
			     </div>
			   </div>
        </section>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
	    <script>
	    	new Vue({
	    		el:'.main',
	    		data:{
	    			m_data:[],
	    			cno:1,
	    			curpage:1,
	    			totalpage:0
	    		},
	    		mounted:function(){
	    			axios.get("http://localhost/web/movie/rest_list.do",{
	    				params:{
	    					cno:this.cno,
	    					page:this.curpage
	    				}
	    			}).then(response=>{
	    				console.log(response);
	    				console.log(response.data);
	    				this.m_data=response.data;
	    				this.curpage=this.m_data[0].curpage;
	    	  			this.totalpage=this.m_data[0].totalpage;
	    			})
	    		},
	    		methods:{
	    			change:function(cno){
	    				this.cno=cno;
	    				this.curpage=1;
	    				axios.get("http://localhost/web/movie/rest_list.do",{
	    					params:{
	    						cno:this.cno,
	    						page:this.curpage
	    					}
	    				}).then(response=>{
	    					console.log(response.data);
	    					this.m_data=response.data;
	    					//this.m_data=response.data;
	    					this.curpage=this.m_data[0].curpage;
	    	  	  			this.totalpage=this.m_data[0].totalpage;
	    				})
	    			},
	    			prev:function(){
	    				this.curpage=this.curpage>1?this.curpage-1:this.curpage;
	    				axios.get("http://localhost/web/movie/rest_list.do",{
	    					params:{
	    						page:this.curpage,
	    						cno:this.cno
	    					}
	    				}).then(response=>{
	    					this.m_data=response.data;
	    					//this.m_data=response.data;
	    				})
	    			},
	    			next:function(){
	    				this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
	    				axios.get("http://localhost/web/movie/rest_list.do",{
	    					params:{
	    						page:this.curpage,
	    						cno:this.cno
	    					}
	    				}).then(response=>{
	    					//this.m_data=response.data;
	    					this.m_data=response.data;
	    				})
	    			}
	    		}
	    	})
	    </script>
    </main>
  </body>
</html>