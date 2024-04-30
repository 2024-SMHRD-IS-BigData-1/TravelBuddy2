<%@page import="com.smhrd.model.CommunityDAO"%>
<%@page import="com.smhrd.model.Community"%>
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
<title>TravelBuddy</title>
<style>
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
   background-color: #2D2F7A;
   color: #fff;
   border: none;
   padding: 10px 20px;
   cursor: pointer;
}

.comment-form button:hover {
   background-color: #1e1f5e;
}

@import
   url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap')
   ;

* {
   box-sizing: border-box;
   outline: none;
}

body {
   font-family: 'Noto Sans KR', sans-serif;
   background-color: #f2f2f2;
}

textarea#title {
   height: 40px;
}

textarea#content {
   height: 150px;
}

.container {
   margin: 0 auto;
   max-width: 800px;
   padding: 20px 15px;
   text-align: center;
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
   font-family: 'Noto Sans KR', sans-serif;
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
   border-left: 2px solid #ccc; /* 구분선 */
   padding-left: 10px; /* 내용과의 간격 조절 */
}

.action-buttons {
   margin-top: 10px;
}

.action-buttons button {
   margin-right: 10px;
}
</style>
<link rel="stylesheet" href="css/post(write).css">
</head>
<body>
   <div class="container">
      <div id="wrap" class="box">
         <h2>작성글</h2>
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
            // CommunityDAO를 사용하여 b_idx에 해당하는 게시물을 조회합니다.
            String Community_idx_param = request.getParameter("b_idx");
            int b_idx = -1; // 기본값 설정

            // b_idx 파라미터가 전달되었다면 해당 값을 변수에 저장
            if (Community_idx_param != null && !Community_idx_param.isEmpty()) {
               b_idx = Integer.parseInt(Community_idx_param);
            }

                if (Community_idx_param != null) {
                	Community community = new CommunityDAO().detailCommunity(b_idx);
                    if (community != null) {
                %>
         		<p>
         			<td>제목</td>
         			<td><%=community.getTitle() %></td>
         		</p>
         		<p>
         			<td>카테고리</td>
         			<td><%=community.getB_category() %></td>
         		</p>
         		<p>
         			<td>내용</td>
         			<h3><%=community.getB_content() %></h3>
         			<img src="./img/<%=loginMember.getMem_id() %>/<%=community.getFilename() %>">
         		</p>
         <div id="comment-form">
            <%
            // mem_id가 로그인되어 있을 때만 댓글을 작성할 수 있도록 함
            if (loginMember != null) {
            %>
            <form action="AddCommentServlet" method="post">
               <textarea id="comment-content" name="comment-content"
                  placeholder="댓글을 입력하세요" required></textarea>
               <input type="hidden" id="buddy_idx" name="buddy_idx"
                  value="<%=b_idx%>">
               <button type="submit">댓글 작성</button>
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
            List<Comment> comments = commentDAO.getCommentsByBuddyIdx(b_idx);

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
                  </div>
               </div>
               <div id="reply-form-<%=comment.getComment_id()%>"
                  style="display: none; margin-top: 10px;">
                  <form action="AddChildCommentServlet" method="post">
                     <textarea name="comment-content" placeholder="대댓글을 입력하세요"
                        required style="width: 100%;"></textarea>
                     <input type="hidden" name="buddy_idx" value="<%=b_idx%>">
                     <input type="hidden" name="parent_comment_id"
                        value="<%=comment.getComment_id()%>">
                  </form>
               </div>
                  </div>
               </div>
            </div>
            <%
            }
            } else {
            // 댓글이 없을 경우 메시지 출력
            %>
            <p style="margin-top: 20px;">댓글이 없습니다.</p>
            <%
            }
          }
      	}
            %>
         </div>
	         <div class="button">
	            <!-- 게시물 목록 페이지로 이동하는 링크 -->
	            <button type="button" class="btn btn-danger my-3" onclick="deletePost(this)" font-family="Freesentation-9Black">삭제</button>
	            <a href="Community.jsp"><button>돌아가기</button></a>
	         </div>
	      </div>
	   </div>
   </div>
</div>



</body>
</html>
