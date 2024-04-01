<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
<script type="text/javascript">

	function report(){	
		alert("신고");
	}

  	function reply(f){ 

		var text = f.replyBox.value;
		var num = f.rev_num.value;
		
		if(text==''){
			alert("답병을 작성해주세요")
			return;
		}
		
		var url = "review_reply";
		var param = "rev_num=" + num+"&replyBox="+text;
		
		sendRequest(url,param,reply_check,"post");
	}
	
	function reply_check(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			
			var json = (new Function('return' + data))();
			
			if(json[0].result == 'yes'){
				alert("답변 성공")
				location.href='review_form';
			} else {
				alert('답변 실패')
			}
		}
	}
	
	function del(f) {
		var text = "삭제된 답변입니다.";
		var num = f.rev_num.value;
		
		
		var url = "review_reply";
		var param = "rev_num=" + num+"&replyBox="+text;
		
		sendRequest(url,param,reply_check,"post");
	}
		
</script>
 

<style type="text/css">
	#reviewBox{
		width: 800px;
		height: 200px;
		margin: auto;
		margin-top: 20px;
		margin-bottom: 50px;
		border: 1px solid blue;
	}
	
	#reviewStar{
		margin-left: 5px;
		margin-top: 5px;
		display: flex;
	}
	
	h3{
		margin-top: 0px;
		margin-left: 5px;
		margin-bottom: 5px;
	}
	
	hr{
		margin-bottom: 0px;
		margin-top: 0px;
	}
	
	#date{
		margin-top: 5px;
		margin-bottom: 0px;
	}

	span{
	  font-size: 2rem ;
	  line-height: 2.5rem;
	  color: gold;
	}

	#replyBox{
		width: 660px;
		height: 35px;
		resize: none;
	}
	
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/business/businessTopView.jsp"></jsp:include>
	<input type="hidden" name="bu_email" value="${bu_email}">
	
	<c:forEach var="dto" items="${list}">
	<form>
	<div id="reviewBox" align="center" >
		<hr>
		<div align="left" id="review">
			<input type="hidden" name="rev_num" value="${dto.rev_num}">
			<p align="right" id="date">${dto.regdate}</p>
			<h3 style="display: inline;" align="left"><img src="resources/img/report_icon.png" style="width: 30px; height: 30px;" onclick="report()" ></h3>
			<span>
				<c:forEach begin="1" end="${dto.score}">★</c:forEach>
			</span>
			<p>${dto.m_email} - ${dto.ro_name}</p>
			<p>${dto.content}</p>
			<p><img src="resources/img/reply_icon.png" style="width: 20px; height: 20px; " >${dto.content_reply}</p>
			<textarea id="replyBox" ></textarea>
			<c:choose>
				<c:when test="${dto.content_reply eq '답글 작성 전' or dto.content_reply eq '삭제된 답변입니다.'}">
					<input type="button" value="답글 작성하기" onclick="reply(this.form);">
				</c:when>
				<c:otherwise>
					<input type="button" value="수정" onclick="reply(this.form);">
					<input type="button" value="삭제" onclick="del(this.form);">
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
	</form>
	</c:forEach>	
</body>
</html>