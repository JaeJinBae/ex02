<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<style type="text/css">
	#wrapContent #list tr > td, th{
		border:1px solid black;
	}
	#wrapContent #list{
		border-collapse:collapse;
		margin:10px;
		text-align: center;
	}
	#wrapContent{
		position: relative;
	}
	#modal{
		background:yellow;
		padding:15px;
		width:250px;
		position: absolute;
		top:20px;
		left:20px;
		display: none;
	}
</style>
<script type="text/javascript">
	$(function(){
		function showList(){
			$.ajax({
				url:"/ex02/member/list",
				type:"get",
				dataType:"json",
				success:function(json){
					console.log(json);					
					$("#list").empty();

					var source=$("#template").html();
					var t_fn=Handlebars.compile(source);
					
					$("#list").html(t_fn(json));
				}
			});
		}
		
		$("#addBtn").click(function(){
			var userid=$("input[name='id']").val();
			var username=$("input[name='name']").val();
			var userpw=$("input[name='pw']").val();
			var email=$("input[name=mail]").val();
			var sendData={userid:userid,username:username,userpw:userpw,email:email};
			
			$.ajax({
				url:"/ex02/member/",
				type:"post",
				headers:{"Content-Type":"application/json"},
				dataType:"text",
				data:JSON.stringify(sendData),
				success:function(result){
					console.log(result);
					showList();
				}
			});
		});
		
		$("#listBtn").click(function(){
			showList();
		});
		$(document).on("click","#showModal",function(){
			$("#modal").css("display","block");
			var id=$(this).parents("tr").find("td:eq(0)").text();
			var name=$(this).parents("tr").find("td:eq(1)").text();
			var pw=$(this).parents("tr").find("td:eq(2)").text();
			var email=$(this).parents("tr").find("td:eq(3)").text();
			
			$("#id").val(id);
			$("#name").val(name);
			$("#pw").val(pw);
			$("#email").val(email);
		});
		$(document).on("click","#close",function(){
			$("#modal").css("display","none");
		});
		
		$(document).on("click","#delete",function(){
			var item=$(this).parents("tr").find("td:eq(0)").text();
			$.ajax({
				url:"/ex02/member/"+item,
				type:"delete",
				dataType:"text",
				success:function(result){
					console.log(result);
					alert("삭제되었습니다.");
					showList();
				}
			})
		});
		$(document).on("click","#modify",function(){
			var id=$("#id").val();
			var name=$("#name").val();
			var pw=$("#pw").val();
			var email=$("#email").val();
			var sendData={userid:id, username:name, userpw:pw, email:email};
			
			$.ajax({
				url:"/ex02/member/"+id,
				type:"put",
				dataType:"text",
				data:JSON.stringify(sendData),
				headers:{"Content-Type":"application/json"},
				success:function(result){
					console.log(result);
					$("#modal").css("display","none");
					showList();
				}
			});
		});
		
	});
</script>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="pw"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="mail"></td>
		</tr>
	</table>
	<button id="addBtn">추가</button>
	<button id="listBtn">리스트 가져오기</button>
	
	<div id="wrapContent">
		<div id="modal">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" id="id" readonly="readonly"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" id="pw"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email"></td>
				</tr>
			</table>
			<button id="modify">수정</button>
			<button id="close">닫기</button>
		</div>
		<table id="list">
		</table>
	</div>
	<script id="template" type="text/x-handlebars-template">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>function</th>
		</tr>		
		{{#each.}}
		<tr>
			<td>{{userid}}</td>
			<td>{{username}}</td>
			<td>{{userpw}}</td>
			<td>{{email}}</td>
			<td><button id='showModal'>수정</button><button id='delete'>삭제</button></td>
		</tr>
		{{/each}}
	</script>
</body>
</html>