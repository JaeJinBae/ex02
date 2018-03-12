<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn1").click(function(){
			$.ajax({
				url:"/ex02/json/map",
				dataType:"json",
				type:"get",
				success:function(result){
					console.log(result); 
				}
			})
		});
		$("#btn2").click(function(){
			$.ajax({
				url:"/ex02/json/sendList",
				dataType:"json",
				type:"get",
				success:function(result){
					console.log(result); 
				}
			})
		});
		$("#btn3").click(function(){
			$.ajax({
				url:"/ex02/json/sendMapAuth",
				data:{"test1":"jayZ","test2":"1234"},
				dataType:"json",
				type:"get",
				success:function(result){
					console.log(result); 
				}
			})
		});
	});
</script>
</head>
<body>
	<button id="btn1">map test</button>
	<button id="btn2">list test</button>
	<button id="btn3">test</button>
	
</body>
</html>
