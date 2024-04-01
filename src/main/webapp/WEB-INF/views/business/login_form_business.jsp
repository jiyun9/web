<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/login_form_user.css">
</head>
<body>

   <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

   <form>
      <main>
         <div class="login content">
            <div class="inner">
               <div class="loginMethod-box">
                  <h1 class="loginMethod">비즈니스 회원 로그인</h1>
               </div>
               <div class="login-info">
                  <div class="email-area">
                     <p>
                        <label for="email">이메일</label>
                     </p>
                     <input type="text" name="bu_email" placeholder="korea@yescompany.co.kr" />
                     <p class="error message"></p>
                  </div>
                  <div class="password-area">
                     <p>
                        <label for="pwd">비밀번호</label>
                     </p>
                     <input type="password" name="bu_password" placeholder="비밀번호를 입력하세요." />
                     <p class="error message"></p>
                  </div>
               </div>
               <div class="login-setting">
                  <a href="pwd_modify">비밀번호 재설정</a>
               </div>
               <div class="loginBtn-area">
                  <input type="button" class="loginBtn" value="로그인" onclick="send(this.form)">
               </div>
               <div class="info">
                     <p>계정이 없으신가요?</p>
                    <p><a href="business_insert_form">사업자 회원가입</a></p>
                 </div>
               <!-- <input type="button" value="회원가입" onclick="location.href='business_insert_form'"> -->
            </div>
         </div>
      </main>
   </form>


   <script type="text/javascript">
      function send(f) {
         let bu_email = f.bu_email.value.trim();
         let bu_password = f.bu_password.value.trim();

         if (bu_email == '') {
            alert("이메일을 입력해주세요")
            return;
         }
         if (bu_password == '') {
            alert("비밀번호를 입력해주세요")
            return;
         }

         let url = "bu_login";
         let param = "bu_email=" + bu_email + "&bu_password=" + encodeURIComponent(bu_password);

         sendRequest(url, param, myCheck, "post");
      }

      function myCheck() {
         if (xhr.readyState == 4 && xhr.status == 200) {
            let data = xhr.responseText;
            let json = (new Function('return' + data))();

            if (json[0].param == 'no_bu_email') {
               alert('이메일이 존재하지 않습니다.')
            } else if (json[0].param == 'no_bu_password') {
               alert('비밀번호가 올바르지 않습니다.')
            } else {
               alert('로그인 성공')
               location.href = "index";
            }
         }
      }
   </script>
   <script src="resources/js/HttpRequest.js"></script>
</body>
</html>