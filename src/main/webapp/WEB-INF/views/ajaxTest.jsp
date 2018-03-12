<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
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
		
		$("#deleteReplyBtn").click(function(){
			var rno=$("#rno").val();
			
			$.ajax({
				url:"/ex02/replies/"+rno,
				type:"delete",
				dataType:"text",
				success:function(result){
					console.log(result);
					alert("삭제 성공");
				}
			});
		});
		
		$("#listReplyBtn").click(function(){
			var bno=$("#bno").val();
			if(bno==""||bno==null){
				alert("게시글 번호를 입력하세요.");
				return;
			}
			
			$.ajax({
				url:"/ex02/replies/all/"+bno,
				type:"get",
				dataType:"json",
				success:function(json){
					console.log(json);
					$("#list").empty();
					
					var str="";
					$(json).each(function(i,obj){
						str+="<li>댓글번호: "+obj.rno+"<br>"
							+"작성자: "+obj.replyer+"<br>"
							+"댓글내용: "+obj.replytext+"</li><br><br>"
					});
					
					$("#list").append(str);
				}
			});
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
		<button id="deleteReplyBtn">Delete Reply</button>
		<button id="listReplyBtn">Show Reply List</button>
	</div>
	<ul id="list">
		
	</ul>
</body>
</html>