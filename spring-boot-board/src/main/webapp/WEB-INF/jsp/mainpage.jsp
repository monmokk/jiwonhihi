<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset='UTF-8'>
	<link href="https://fonts.googleapis.com/css?family=Gamja+Flower:400" rel="stylesheet">
	<title>Board</title>
	<style>
		body { 
			font-family: 'Gamja Flower', sans-serif;
			text-align: center; 
		}
		
		.list { 
			table-layout: 'fixed';
			border: 0px;
    		border-collapse: collapse;
		}
		th { background-color: LightGray; padding: 5px; }
		td { 
			word-break: 'break-all'; 
			padding: 3px; 
			border-bottom: 1px solid #ccc; 
		}
		
		.btn_top {
			 display: inline-block;
			 border-radius: 3px;
			 background-color: #cfd0d1;
			 border: none;
			 color: white;
			 text-align: center;
			 font-size: 14px;
			 padding: 3px;
			 width: 70px;
			 transition: all 0.5s;
			 cursor: pointer;
			 line-height: 20px;
		}
		.btn_top span {
		 	cursor: pointer;
		 	display: inline-block;
			position: relative;
		 	transition: 0.5s;
		}
		.btn_top span:after {
			 content: '>>';
			 position: absolute;
			 opacity: 0;
			 top: 0;
			 right: -5px;
			 transition: 0.5s;
		}
		.btn_top:hover span { padding-right: 20px; }
		.btn_top:hover span:after {
			opacity: 1;
			right: 0;
		}
				
		a { text-decoration:none; }
	   	a:link { color: DeepSkyBlue; }
		a:visited { color: DarkGray; }
		a:hover { color: LightSkyBlue; }
		
		.pagination { display: inline-block; }
		.pagination a {
		    color: #252525;
		    float: left;
		    padding: 8px 16px;
		    text-decoration: none;
		}
		.pagination a.active {
		    background-color: #03A9F4;
		    color: white;
		    border-radius: 5px;
		}
		.pagination a:hover:not(.active) {
		    background-color: #4FC3F7;
		    border-radius: 5px;
		}
		
		.btn {
			color: white;
		    background-color: #4FC3F7;
		    border-radius: 3px;
		    padding: 3px;
		    width: 140px;
		    text-align: center;
		    font-size: 14px;
		    border: none;
		    cursor: pointer;
		    line-height: 21px;
		}
		.dropdown {
		    position: relative;
		    display: inline-block;
		}
		.dropdown-content {
		    display: none;
		    position: absolute;
		    background-color: #f9f9f9;
		    min-width: 140px;
		    box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.2);
		    z-index: 1;
		}
		.dropdown-content a {
		    color: black;
		    padding: 3px 5px;
		    text-decoration: none;
		    display: block;
		}
		.dropdown-content a:hover { background-color: #f1f1f1 }
		.dropdown:hover .dropdown-content { display: block; }
		.dropdown:hover .btn { background-color: #03A9F4; }
		
		label {
			background-color: #ddd;
			border-radius: 3px;
			padding: 3px;
		}
		p { 
			color: #BDBDBD;
			font-size: 14px;
		}
	</style>
	<script>
		function login(){
			if('${dto.id}' == '' || '${dto.id}' == null){
				if(confirm('글을 작성하시려면 먼저 로그인하셔야 합니다.\n로그인 창으로 이동하시겠습니까?')){
					location.href='login.do?page=login';
					return false;
				}else{
					return false;
				}
			}
		}
	</script>
</head>
<body>
	<hr width='800' size='2' noshade>
	<h1><img src='https://pbs.twimg.com/media/C6Ye6jOUoAAYCPX.jpg' width="600" height="400"></img></h1>
	&nbsp;&nbsp;&nbsp;
	<a href='글쓰기창 이동' onclick='return login();'><button class='btn_top' style='vertical-align: middle'><span>글쓰기</span></button></a>
	&nbsp;&nbsp;&nbsp;

	<hr width='800' size='2' noshade>
	<br>
	
	<table class='list' width='800' align='center'>
	<tr>
		<th>글번호</th>
		<th width='50%'>글제목</th>
		<th>작성시간</th>
	</tr>
 	
	<c:forEach var='list' items='${list}'>
	<tr>
		<td>${list.BNO}</td>
		<td align='center'>
			<a href=''>
			${list.TITLE}</a>
		</td>
		<td>${list.RDATE}</td>
	</tr>
	</c:forEach>


	</table>

</body>
</html>