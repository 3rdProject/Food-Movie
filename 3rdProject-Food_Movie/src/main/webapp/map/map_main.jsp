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
	<script src="https://unpkg.com/react@15/dist/react.js"></script>
	<script src="https://unpkg.com/react-dom@15/dist/react-dom.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=b1f7be3cfeaa44ff7fc1c8ffcc72b6bc&libraries=services"></script>
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
                <h2 class="module-title font-alt">Food Map</h2>
                <div class="module-subtitle font-serif">Find your Restaurant</div>
              </div>
            </div>
          </div>
        </section>
      </div>
      <section class="module">
      <div class="container">
       <div class="row">
         <div class="col-sm-8 col-sm-offset-2">
            <div class="search-box">
                <input class="form-control" type="text" placeholder="서울" v-model="ss">
                <button class="search-btn" type="submit" v-on:click="movieFind()"><i class="fa fa-search"></i></button>
            </div>
          </div>
          <div style="height:80px"></div>
       <div class="col-sm-12 app" id="root">
<%--    <script type="text/babel">
     class MapList extends React.Component
     {
         // 변수 선언 
         constructor(props)
         {
              super(props)
              this.state={
                 map_list:[], 
                 map_detail:{}, 
                 open:false
              }
         }
         // 데이터 읽기 => 저장 
         componentWillMount()
         {
              axios.get("http://localhost/web/map/rest_map_main.do")
              .then(response=>{
                  console.log(response.data)
                  this.setState({map_list:response.data})  
              })
         }
         mapDetailData(m)
         {
              this.setState({map_detail:m,open:true})
         }
         // 읽기 데이터 출력
         render()
         {
             let html=this.state.map_list.map((m)=>
                   <tr onClick={this.mapDetailData.bind(this,m)}>
                        <td className="text-center">
                         <img src={m.poster} style={{"width":"30px","height":"30px"}}/>
                        </td>
                        <td>{m.rname}</td>
                        <td>{m.score}</td>
                        <td>{m.addr}</td>
                   </tr>
             )
             return (
               <div>
                 <div className="col-sm-8">
                   <table className="table" id="detail">
                     <thead>
                       <tr>
                        <th className="text-center"></th>
                        <th className="text-center">음식점</th>
                        <th className="text-center">평점</th>
                        <th className="text-center">주소</th>
                       </tr>
                     </thead>
                     <tbody>
                       {html}
                     </tbody>
                   </table>
                 </div>
                 <div className="col-sm-4">
                   {this.state.open?<MapDetail map={this.state.map_detail}/>:null}
                 </div>
               </div>
             )
         } 
     }
     class MapDetail extends React.Component
     {
         render()
         {
             return (
                <table className="table">
                  {/* render() */}
                  <tr>
                    <td className="text-center" width="30%" rowSpan="8">
                      <img src={this.props.map.poster} width="100%"/>
                    </td>
                    <td colSpan="2">{this.props.map.rname}</td>
                  </tr>
                  <tr>
                    <td width="20%" className="text-center">영업시간</td>
                    <td width="50%">{this.props.map.openhour}</td>
                  </tr>
                  <tr>
                    <td width="20%" className="text-center">음식종류</td>
                    <td width="50%">{this.props.map.rtype}</td>
                  </tr>
                  <tr>
                    <td width="20%" className="text-center">주소</td>
                    <td width="50%">{this.props.map.addr}</td>
                  </tr>
                  <tr>
                    <td width="20%" className="text-center">번호</td>
                    <td width="50%">{this.props.map.tel}</td>
                  </tr>
                  <tr>
                    <td width="20%" className="text-center">가격대</td>
                    <td width="50%">{this.props.map.price}</td>
                  </tr>
                </table>
             )
         }
     }
     ReactDOM.render(<MapList /> , document.querySelector('.app'))
     /*
             <MovieList />   => render() return값을 받는다(HTML)
             $('.app').html(html)
     */
   </script>--%> 
   
   </div>
   <script src="bundle.js"></script>
   </div>
   </div>
   </section>
    </main>
<%--     <div class="content">
	<div class="store_search_wrapper">
	    <div id="map" style="width:100%; height:700px"></div>
	 	<div class="map_search_layer">
	 			<h4 class="text-center" style="padding:15px"><b>음식점찾기</b></h4>
				<div class="blog__sidebar__search">
						<form onsubmit="return false">
						<input type="text" placeholder="지역 또는 음식점 찾기" v-model="ss">
						<button v-on:click="searchList(),pageRiset()">
							<span class="icon_search"></span>
						</button>
						</form>
				</div>
				<div style="margin-bottom: 10px;" v-if="shop_data.length!=0">검색결과 총 {{total}}건</div>
				<div style="margin-bottom: 10px;" v-else>검색결과가 없습니다</div>
				<div class="search__sidebar__item">
						<div class="search__sidebar__recent shop_bar">
							<div v-for="(vo,index) in shop_data" :key="vo.id">
								 <div class="search__sidebar__recent__item" v-on:click="clickData(index)">
									<div class="search__sidebar__recent__item__text">
										<h6 class=name>{{vo.rname}}</h6>
										<span>{{vo.addr}}<br></span>
										<span>연락처: {{vo.tel}}</span>
										<span>영업시간: {{vo.openhour}}</span>
										<hr>
									</div>
								</div>
							</div>
						</div>
				</div>
			<div class="page" style="text-align:center">
				<b class="page" href="#" v-on:click="paging(page-1)" v-show="page>1">&lt;</b>{{page}}/{{totalpage}}<b class="page" href="#" v-on:click="paging(page+1)" v-show="page<totalpage">&gt;</b>
			</div>
			</div>
			<!-- no, poster, rname, score, address, tel, rtype, price, openhour -->
						<div class="row map" v-if="show">
							<h4 style="padding:0px">{{map_detail.rname}}</h4><span style="color:orange">{{map_detail.score}}</span>
							<table class="table" style="table-layout:fixed; height:320px">
									<button class="float-right" v-on:click="show=false">X</button>
								<tr>
									<td><img :src="map_detail.poster"></td>
								</tr>
								<tr>
									<th width=20%>영업</th>
									<td width=80% v-if="shop_detail.open">{{map_detail.openhour}}</td>
									<td width=80% v-if="!shop_detail.open">등록된 영업시간이<br> 없습니다</td>
								</tr>
								<tr>
									<th width="20%">음식종류</th>
									<td width=80%>{{map_detail.rtype}}</td>
								</tr>
								<tr>
									<th width="20%">주소</th>
									<td width=80%>{{map_detail.addr}}</td>
								</tr>
								<tr>
									<th width="20%">번호</th>
									<td width=80%>{{map_detail.tel}}</td>
								</tr>
								<tr>
									<th width=20%>가격대</th>
									<td width=80%>{{map_detail.price}}</td>
								</tr>							
							</table>
						</div>
					</div>
	   </div>
	   <jsp:include page="${map_list}"></jsp:include>
<script>
</script>--%>
</body>
</html>