<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<%@ include file="../common/header.jsp" %>

<link rel="stylesheet" href="/css/manager/qnaDetailCss.css">

<div class="container">
    <h2>1:1 사용자 문의 상세</h2>

    <div class="info-box">
        <p><strong>제목:</strong> ${userQna.uqna_title}</p>
        <p><strong>내용:</strong> ${userQna.uqna_content}</p>
        <p><strong>문의일:</strong> 
            <fmt:formatDate value="${userQna.uqna_wdate}" pattern="yyyy-MM-dd" />
        </p>
        
        <p><strong>처리 상태:</strong>
            <c:choose>
                <c:when test="${userQna.uqna_stat == 1}">처리완료</c:when>
                <c:otherwise>대기중</c:otherwise>
            </c:choose>
        </p>
    </div>

    <c:if test="${userQna.uqna_stat == 0}">
        <form method="post" action="/admin/qna/user/${userQna.uqna_idx}/reply" onsubmit="return validateAnswer()">
            <textarea name="answer" placeholder="답변을 입력하세요"></textarea>
            <div class="button-group">
                <button type="submit">확인</button>
                <a href="/admin/qna?type=user&page=1&size=10&sortBy=date&order=desc" class="back-button">이전</a>
            </div>
        </form>
    </c:if>

    <c:if test="${userQna.uqna_stat == 1}">
        <div class="answer-box">
            <p><strong>답변 내용:</strong> ${userQna.uqna_answer}</p>
        </div>
        <div class="button-group">
            <a href="/admin/qna?type=user&page=1&size=10&sortBy=date&order=desc" class="back-button">이전</a>
        </div>
    </c:if>
</div>

<script>
    // 답변 입력 여부 확인
    function validateAnswer() {
        var answer = document.querySelector("textarea[name='answer']").value.trim();
        if (answer === "") {
            alert("답변은 꼭 입력해야 합니다.");
            return false; // 폼 제출을 막음
        }
        return true; // 폼 제출 허용
    }
</script>

<%@ include file="../common/footer.jsp" %>
