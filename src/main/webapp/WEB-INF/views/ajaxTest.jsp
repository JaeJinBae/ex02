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
	.pagination{
		width:100%;
	}
	.pagination li{
		list-style: none;
		float:left;
		padding:3px;
		border:1px solid blue;
		margin:3px;
	}
	.pagination a{
		text-decoration: none;
		color:black;
	}
	.pagination li.active a{
		color:red;
		background: skyblue;
	}
</style>
<script type="text/javascript">
	$(function(){
		var page=1;
		
		$("#newReplyBtn").click(function(){
			var bno=$("#bno").val();
			var replyer=$("#replyer").val();
			var replytext=$("#replytext").val();
			
			var sendData={bno:bno, replyer:replyer, replytext:replytext};
			
			$.ajax({
				url:"/ex02/replies/",
				type:"post",
				headers:{"Content-Type":"application/json"},
				dataType:"text",
				data:JSON.stringify(sendData),//json객체를 json string 으로 변경해줌
				success:function(result){
					console.log(result);
					alert("success");
				}
			})
		});
		
		$("#modifyReplyBtn").click(function(){
			var rno=$("#rno").val();
			var replytext=$("#replytext").val();
			var sendData={replytext:replytext};
			
			$.ajax({
				url:"/ex02/replies/"+rno,
				type:"put",
				dataType:"text",
				data:JSON.stringify(sendData),
				headers:{"Content-Type":"application/json"},
				success:function(result){
					console.log(result);
					alert("수정 성공");
				}
			});
		});
		
		$(document).on("click",".deleteReplyBtn",function(){
			var rno=$(this).parent().find(".hiddenRno").val();
			$.ajax({
				url:"/ex02/replies/"+rno,
				type:"delete",
				dataType:"text",
				success:function(result){
					console.log(result);
					alert("삭제 성공");
					showList();
				}
			});
		});
		
		
		$("#listReplyBtn").click(function(){
			var bno=$("#bno").val();
			
			if(bno==""||bno==null){
				alert("게시글 번호를 입력하세요.");
				return;
			}
			showList()
		});
		
		function showList(){
			var bno=$("#bno").val();
			$.ajax({
				url:"/ex02/replies/"+bno+"/"+page,
				type:"get",
				dataType:"json",
				success:function(json){
					console.log(json);					
					$("#list").empty();

					
					var source=$("#template").html();
					var t_fn=Handlebars.compile(source);
					
					$("#list").html(t_fn(json));
					printPaging(json.pageMaker);
				}
			});
		}
		
		function printPaging(pageMaker){
			var str="";
			if(pageMaker.prev){
				str+="<li><a href=''"+(pageMaker.startPage-1)+"> << </a></li>"
			}
			
			for(var i=pageMaker.startPage;i<=pageMaker.endPage;i++){
				if(pageMaker.cri.page==i){
					str+="<li class='active'><a href='"+i+"'>"+i+"</a></li>";
				}else{
					str+="<li><a href='"+i+"'>"+i+"</a></li>";
				}
			}
			
			if(pageMaker.next){
				str+="<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>"
			}
			$(".pagination").html(str);
		}
		
		$(".pagination").on("click","li a",function(e){
			e.preventDefault();
			page=$(this).attr("href");
			showList();
		});
	});
</script>
</head>
<body>
	<h1>Ajax Test Page입니다.</h1>
	<div>
		<div>
			게시글 번호
			<input type="text" name="bno" id="bno">
		</div>
		<div>
			댓글 번호
			<input type="text" name="rno" id="rno">
		</div>
		<div>
			Replyer
			<input type="text" name="replyer" id="replyer">
		</div>
		<div>
			Reply Text
			<input type="text" name="replytext" id="replytext">
		</div>
		<button id="newReplyBtn">Add Reply</button>
		<button id="modifyReplyBtn">Modify Reply</button>
		
		<button id="listReplyBtn">Show Reply List</button>
	</div>
	<ul id="list">
	</ul>
	<script id="template" type="text/x-handlebars-template">
		{{#list}}
		<li>
			<input class='hiddenRno' type="hidden" value="{{rno}}">
			{{rno}}<button class="deleteReplyBtn">삭제</button><br>
			{{replyer}}<br>
			{{replytext}}
		</li>
		{{/list}}
	</script>
	
	<ul class="pagination">
	</ul>
</body>
</html>
















