<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.model.BuddyFinding"%>
<%@ page import="com.smhrd.model.BuddyFindingDAO"%>
<%@ page import="com.smhrd.model.Comment"%>
<%@ page import="com.smhrd.model.CommentDAO"%>
<%@ page import="com.smhrd.model.Member"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<style>

@font-face {
    font-family: 'Freesentation-9Black';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/2404@1.0/Freesentation-9Black.woff2') format('woff2');
    font-weight: 900;
    font-style: normal;
}
body {
   font-family: 'Freesentation-9Black';
    margin-top: 20px;
    background-color: #eee;
}

button{
   font-family: 'Freesentation-9Black';
}

#comments {
   margin-top: 20px;
}

#comments h3 {
   margin-bottom: 10px;
}

.comment {
   margin-bottom: 20px;
   padding: 10px;
   background-color: #f2f2f2;
   border-radius: 8px;
}

.comment strong {
   display: block;
   margin-bottom: 5px;
}

.comment p {
   margin: 0;
}

#post p {
   text-align: left;
}

#post p strong {
   font-size: 22px;
}

#comments {
   text-align: left;
   font-size: 20px;
}

.comment-form button {
   font-family: 'Freesentation-9Black';
   background-color: #2D2F7A;
   color: #fff;
   border: none;
   padding: 10px 20px;
   cursor: pointer;
}

.comment-form button:hover {
   font-family: 'Freesentation-9Black';
   background-color: #1e1f5e;
}

* {
   box-sizing: border-box;
   outline: none;
}

body {
   font-family: 'Freesentation-9Black';
   background-color: #f2f2f2;
}

textarea#title {
   height: 40px;
}

textarea#content {
   height: 150px;
   
}

.container {
   color: gray;
   margin: 0 auto;
   max-width: 800px;
   padding: 20px 15px;
}

.btn {
   background-color: #2D2F7A;
   color: #fff;
   border: none;
   padding: 10px 20px;
   cursor: pointer;
}

.btn:hover {
   background-color: #1e1f5e;
}

textarea {
   width: calc(100% - 22px);
   padding: 10px;
   border: 1px solid #dadada;
   margin-bottom: 10px;
   resize: vertical;
}

table {
   width: 100%;
   border-collapse: collapse;
   margin-bottom: 20px;
}

th, td {
   padding: 10px;
   border: 1px solid #ddd;
   text-align: left;
}

th {
   background-color: #f2f2f2;
}

@media ( max-width : 768px) {
   .container {
      padding: 20px 10px;
   }
   table {
      font-size: 14px;
   }
}

.select-box {
   width: 100%;
   height: 50px;
   box-sizing: border-box;
   margin-bottom: 5px;
   padding: 5px 0 5px 10px;
   border-radius: 4px;
   border: 1px solid #d9d6d6;
   color: #383838;
   background-color: #ffffff;
   font-family: 'Freesentation-9Black';
}

.option {
   font-size: 14px;
}

#map {
   height: 300px;
   width: 100%;
   margin-bottom: 20px;
}

.box {
   background-color: #ffffff;
   padding: 20px;
   border-radius: 8px;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.child-comment {
   margin-left: 20px; /* 들여쓰기 */
   padding-left: 10px; /* 내용과의 간격 조절 */
}

.action-buttons {
   font-family: 'Freesentation-9Black';
   margin-top: 10px;
}

.action-buttons button {
   font-family: 'Freesentation-9Black';
   margin-right: 10px;
}

#footer>#search-area {
            display: flex;
            width: 500px;
            height: 40px;
            justify-content: space-between;
            align-items: center;
            margin: 20px auto;
            border: 1px solid lightgray;
            border-radius: 20px;
            padding: 0 14px;
        }

#text-area>input {
            width: 350px;
            border: 0;
            outline: 0;
        }

#text-area>div>button {
            padding: 0 8px;
        }
        
#main2>#text-area {
            display: flex;
            width: 500px;
            height: 40px;
            justify-content: space-between;
            align-items: left;
            margin: 20px auto;
            border: 1px solid lightgray;
            border-radius: 20px;
            padding: 0 14px;
        }

</style>
<link rel="stylesheet" href="css/post(write).css">
</head>
<body>
   <div class="container">
      <div id="wrap" class="box">
          <div id="header">
         <div id="post">
            <%
            // 세션에서 로그인된 사용자 정보를 가져옵니다.
            Member loginMember = (Member) session.getAttribute("loginMember");

            // 만약 loginMember 세션 속성이 존재하지 않는다면 로그인되지 않은 상태입니다.
            // 따라서 로그인 페이지로 리다이렉트하거나 다른 처리를 할 수 있습니다.
            if (loginMember == null) {
               response.sendRedirect("Login.jsp");
               return; // 로그인 페이지로 이동했으므로 더 이상 진행하지 않습니다.
            }
            %>

            <%
            // BuddyFindingDAO를 사용하여 buddy_idx에 해당하는 게시물을 조회합니다.
            String buddy_idx_param = request.getParameter("buddy_idx");
            int buddy_idx = -1; // 기본값 설정

            // buddy_idx 파라미터가 전달되었다면 해당 값을 변수에 저장
            if (buddy_idx_param != null && !buddy_idx_param.isEmpty()) {
               buddy_idx = Integer.parseInt(buddy_idx_param);
            }

            if (buddy_idx_param != null) {
               BuddyFinding buddyFinding = new BuddyFindingDAO().getBuddyFindingByBuddyIdx(buddy_idx);
               if (buddyFinding != null) {
            %>
         </div>
            <div id="content">
            <p style="font-size: 200%; color: black;">
               <%=buddyFinding.getTitle()%> <br> <!-- 제목 -->
            </p>
            <p>
            <strong>여행일정</strong>
            </p>
            <p class="comment child-comment" style="margin-left: 0;">
               <%=buddyFinding.getTravel_dt()%> <br> <!-- 여행날짜 -->
               <%=buddyFinding.getPlace_name()%> <br> <!-- 여행국가 -->
               <%=buddyFinding.getMem_id()%> <br> <!-- 작성자 닉네임 -->
            </p>
            <p>
            <strong>여행소개</strong>
            </p>
            <p>
               <%=buddyFinding.getContent()%> <br> <!-- 내용 -->
            </p>
            </div>
            
            <div>
            <div id="map" style="width: 50%; height: 200px;"></div>
            <p style="display:none;">
               <span id="lat"><%=buddyFinding.getLat()%></span>, <span id="lng"><%=buddyFinding.getLng()%></span>
            </p>
            <%
            } else {
            %>
            <p>해당하는 게시물이 없습니다.</p>
            <%
            }
            } else {
            %>
            <p>게시물을 선택해주세요.</p>
            <%
            }
            %>
            </div>
         </div>
         <div id="comment-form">
            <%
            // mem_id가 로그인되어 있을 때만 댓글을 작성할 수 있도록 함
            if (loginMember != null) {
            %>
            <div id=comment(1)><h3>댓글</h3></div>
            <div id="main2">
            <div id="text-area">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input id="text-input" type="text" name="text-input" >
                <input type="hidden" id="buddy_idx" name="buddy_idx"
                  value="<%=buddy_idx%>">
                <div>
                	<button type="submit">댓글 작성</button>
                </div>
            </div>
        	</div>
        	
            <div id="footer">
            <form action="AddCommentServlet" method="post">
            <div id="text-area">
               <input type="text" name="comment-content">
            </div>   
               <!-- <textarea id="comment-content" name="comment-content"
                  placeholder="댓글을 입력하세요" required></textarea> -->
               <input type="hidden" id="buddy_idx" name="buddy_idx"
                  value="<%=buddy_idx%>">
               <div>
               <button type="submit">댓글 작성</button>
               </div>
            </form>
            <%
            } else {
            %>
            <p>댓글을 작성하려면 로그인이 필요합니다.</p>
            <%
            }
            %>

         </div>
         <div id="comments">
            <h3>댓글 목록</h3>
            <!-- 댓글 목록 출력하는 부분 -->
            <%
            // CommentDAO 인스턴스 생성
            CommentDAO commentDAO = new CommentDAO();

            // 댓글 목록 가져오기
            List<Comment> comments = commentDAO.getCommentsByBuddyIdx(buddy_idx);

            if (comments != null && !comments.isEmpty()) {
               // 댓글이 있을 경우 출력
               for (Comment comment : comments) {
            %>
            <div class="comment">
               <div style="display: flex; align-items: center;">
                  <strong style="margin-right: 10px;"><%=comment.getMem_id()%></strong>
                  <div style="flex-grow: 1;">
                     <p><%=comment.getComment_content()%></p>
                     <p><%=comment.getComment_date()%></p>
                  </div>
                  <div class="action-buttons">
                     <%
                     // 로그인한 사용자와 댓글 작성자가 일치하는 경우에만 삭제 버튼을 출력
                     if (loginMember != null && loginMember.getMem_id().equals(comment.getMem_id())) {
                     %>
                     <form action="DeleteCommentServlet" method="post">
                        <input type="hidden" name="comment_id"
                           value="<%=comment.getComment_id()%>">
                        <button type="submit">댓글 삭제</button>
                     </form>
                     <%
                     }
                     %>
                     <button onclick="showReplyForm(<%=comment.getComment_id()%>)">대댓글
                        작성</button>
                  </div>
               </div>
               <div id="reply-form-<%=comment.getComment_id()%>"
                  style="display: none; margin-top: 10px;">
                  <form action="AddChildCommentServlet" method="post">
                     <textarea name="comment-content" placeholder="대댓글을 입력하세요"
                        required style="width: 100%;"></textarea>
                     <input type="hidden" name="buddy_idx" value="<%=buddy_idx%>">
                     <input type="hidden" name="parent_comment_id"
                        value="<%=comment.getComment_id()%>">
                     <button type="submit" style="margin-top: 10px;">대댓글 작성</button>
                  </form>
               </div>
               <%
               // 대댓글 목록 가져오기
               List<Comment> childComments = commentDAO.getChildCommentsByParentCommentId(comment.getComment_id());

               if (childComments != null && !childComments.isEmpty()) {
                  // 대댓글이 있을 경우 출력
                  for (Comment childComment : childComments) {
               %>
               <div class="comment child-comment" style="margin-left: 30px;">
                  <strong><%=childComment.getMem_id()%></strong>
                  <p><%=childComment.getComment_content()%></p>
                  <p><%=childComment.getComment_date()%></p>
                  <div class="action-buttons">
                     <%
                     // 로그인한 사용자와 대댓글 작성자가 일치하는 경우에만 삭제 버튼을 출력
                     if (loginMember != null && loginMember.getMem_id().equals(childComment.getMem_id())) {
                     %>
                     <form action="DeleteCommentServlet" method="post">
                        <input type="hidden" name="comment_id"
                           value="<%=childComment.getComment_id()%>">
                        <button type="submit">댓글 삭제</button>
                     </form>
                     <%
                     }
                     %>
                  </div>
               </div>
               <%
               }
               }
               %>
            </div>
            <%
            }
            } else {
            // 댓글이 없을 경우 메시지 출력
            %>
            <p style="margin-top: 20px;">댓글이 없습니다.</p>
            <%
            }
            %>
         </div>
         </div>






         <div class="button">
            <!-- 게시물 목록 페이지로 이동하는 링크 -->
            <button type="button" class="btn btn-danger my-3" onclick="deletePost(this)" font-family="Freesentation-9Black">삭제</button>
            <a href="Finding_Buddy.jsp"><button>돌아가기</button></a>
         </div>
      </div>
   </div>

   <!-- JavaScript 코드 -->
   <script>
        function showReplyForm(commentId) {
            var replyForm = document.getElementById("reply-form-" + commentId);
            if (replyForm.style.display === "none") {
                replyForm.style.display = "block";
            } else {
                replyForm.style.display = "none";
            }
        }
    </script>

   <!-- Google Maps API -->





   <script>
        // Google Maps API를 사용하여 지도를 초기화합니다.
        function initMap() {
            var lat = parseFloat(document.getElementById('lat').textContent);
            var lng = parseFloat(document.getElementById('lng').textContent);

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom : 10,
                center : {
                    lat : lat,
                    lng : lng
                }
            });

            var marker = new google.maps.Marker({
                position : {
                    lat : lat,
                    lng : lng
                },
                map : map
            });
        }
    </script>
   <!-- Google Maps API 스크립트 -->
   <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5z9o0mEWFw3Gfsty4lUKD-ytifSz2Pbs&callback=initMap"></script>
</body>
</html>