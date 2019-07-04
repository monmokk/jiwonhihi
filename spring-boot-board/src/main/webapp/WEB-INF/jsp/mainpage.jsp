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
	function lotto(size, lowest, highest) {
    	var numbers = [];
      	for(var i = 0; i < size; i++) {
    		var add = true;
        	var randomNumber = Math.floor(Math.random() * highest) + 1;
        	for(var y = 0; y < highest; y++) {
        		if(numbers[y] == randomNumber) {
    	    		add = false;
        		}
        	}
     		if(add) {
     			numbers.push(randomNumber);
     		} else {
     			i--;
     		}
     	}
      	console.log(numbers.join(" - "));

      	var fin = [];
      	function lotto5(){
	     	var dup5 = [];
	     	var numbers5 = [];
	     	for(var i = 0; i<size; i++){
	     		var add = true;
	     		var randomNumber = Math.floor(Math.random()*size) + 1;
	   			for(var y = 0; y < size; y++){
	   				if(dup5[y] == randomNumber){
	   					add = false;
	   				}else if(randomNumber == 6){
	     				var randomNumber5 = Math.floor(Math.random() * highest) + 1;
	     				for(var x = 0; x < highest; x++) {
	     					if(numbers[x] == randomNumber5) {
	     						add = false;
	     					}
	     				}
	     			}
	   			}
	     		if(add){
	    			dup5.push(randomNumber);
	      			numbers5.push(numbers[dup5[i]]);
	      		} else {
	    	  		i--;
	      		}
	      	}
	     	for(var i = 0; i < highest; i ++){
	     		if(fin[i] == randomNumber5){
	     			lotto5();
	     		}
	     	}
	      	numbers.push(randomNumber5);
	        numbers5.push(numbers[6]);
	    	console.log(numbers5.filter(Number).join(" - "));
	    	
	    	fin.push(numbers[6]);
	    	numbers.pop();
     	}
     	for(var m = 0; m<3; m++){
     		lotto5();
     	}
    }
	</script>
</head>
<body>
	<hr width='800' size='2' noshade>
	<h1><img src='https://pbs.twimg.com/media/C6Ye6jOUoAAYCPX.jpg' width="600" height="400"></img></h1>
	&nbsp;&nbsp;&nbsp;
	<button class='btn_top' style='vertical-align: middle' onclick='lotto(6, 1, 45);'><span>lotto</span></button>
	<div id="numbers"></div>
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