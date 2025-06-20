<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/qnaboard/detail.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

<script src="/js/qnaboard/detail.js"></script>
<canvas id="snow-canvas"></canvas>

<div class="board-detail-container">
    <h1 class="mb-4">문의글 상세보기</h1>

    <div class="card">
        <div class="card-header">
            <h6 class="mb-0">문의글 - ${board.boardRe}</h6>
        </div>
        <div class="card-body">
            <form id="detail_form">
                <div class="form-group">
                    <label for="id">Board Key</label>
                    <input type="text" readonly value="${board.boardKey}" class="form-control" id="id" name="boardKey">
                </div>
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" value="${board.boardTitle}" class="form-control" id="title" name="boardTitle">
                </div>
                <div class="form-group">
                    <label for="content">Content</label>
                    <textarea name="boardContent" class="form-control" rows="5" id="content">${board.boardContent}</textarea>
                </div>

                <div class="form-group">
                    <label>상품 이미지</label><br>
                    <c:if test="${not empty item and not empty item.itemImg1}">
                        <img src="<c:url value='/img/item/${item.itemImg1}'/>" alt="상품 이미지" class="img-thumbnail" style="max-width: 150px;">
                    </c:if>
                    <c:if test="${empty item}">
                        <p class="text-muted">상품 정보 없음</p>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>옵션</label>
                    <p>${board.boardOption}</p>
                </div>
                <div class="form-group">
                    <label>등록일</label>
                    <p><fmt:formatDate value="${board.boardRdate}" pattern="yyyy-MM-dd : HH:mm:ss" /></p>
                </div>
                <div class="form-group">
                    <label>수정일</label>
                    <p><fmt:formatDate value="${board.boardUpdate}" pattern="yyyy-MM-dd : HH:mm:ss" /></p>
                </div>

                <div class="btn-group mt-3">
                    <button id="btn_update" type="button" class="btn btn-outline-primary">
                        <i class="bi bi-pencil-square"></i> 수정
                    </button>
                    <button id="btn_delete" type="button" class="btn btn-outline-danger">
                        <i class="bi bi-trash"></i> 삭제
                    </button>
                </div>
            </form>
        </div>
    </div>

    <c:choose>
        <c:when test="${adminComments == null}">
            <jsp:include page="addAdminComments.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="adminComments.jsp"/>
        </c:otherwise>
    </c:choose>

    <div class="card mt-5 shadow-sm" style="background-color: #f6fbffcc; border-radius: 16px;">
        <div class="card-header" style="background-color: #d0e7f9;">
            <h5 class="mb-0">
                <i class="bi bi-robot me-2"></i>AI 자동 응답 제안
                <button id="generateGpt" type="button" class="btn btn-sm btn-outline-primary float-end ms-2">
                    응답 생성하기
                </button>
                <button id="copyGpt" type="button" class="btn btn-sm btn-outline-secondary float-end">
                    복사
                </button>
            </h5>
        </div>
        <div class="card-body">
            <p id="gptReply" class="text-muted mb-0">버튼을 눌러 AI 응답을 생성하세요.</p>
        </div>
    </div>
</div>
