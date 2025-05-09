<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/css/cherry-blossom.css">
<link rel="stylesheet" href="/css/admin.css">

<div class="detail-form">
  <h2>📄 공지 수정</h2>

  <form method="post" action="<c:url value='/admin/notice/editimpl'/>">
    <input type="hidden" name="id" value="${notice.id}" />
    <input type="hidden" name="adminId" value="${notice.adminId}" />

    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" id="title" name="title" value="${notice.title}" required maxlength="50" />
      <small id="titleCount" style="display:block; margin-top:5px; color:#666;">0 / 50자</small>
    </div>

    <div class="form-group">
      <label for="content">내용</label>
      <textarea id="content" name="content" required>${notice.content}</textarea>
    </div>

    <div class="form-actions">
      <button type="submit" class="submit-btn">수정 완료</button>
      <!-- 삭제 버튼 수정 -->
      <button type="button" class="delete-btn" onclick="confirmDelete()">삭제</button>
    </div>

    <a href="<c:url value='/admin/notice/get'/>" class="back-link">← 목록으로</a>
  </form>

  <!-- ✅ 수정 완료 후 Toast 알림 -->
  <div id="toast" class="toast">공지 수정이 완료되었습니다!</div>

  <!-- ✅ 수정 완료 후 알림 처리 -->
  <c:if test="${not empty success}">
    <script>
      window.addEventListener('DOMContentLoaded', function() {
        var toast = document.getElementById('toast');
        toast.classList.add('show');
        setTimeout(function() {
          toast.classList.remove('show');
        }, 3000);
      });
    </script>
  </c:if>

</div>

<!-- ✅ CKEditor CDN -->
<script src="https://cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>

<!-- ✅ JavaScript (글자수 카운터 및 CKEditor) -->
<script src="/js/admin.js"></script>

<script>
  window.addEventListener('DOMContentLoaded', function() {
    // CKEditor 적용
    if (document.getElementById('content')) {
      CKEDITOR.replace('content');
    }

    // 제목 길이 카운터
    var titleInput = document.getElementById('title');
    var titleCount = document.getElementById('titleCount');

    function updateCount() {
      var count = titleInput.value.length;
      titleCount.textContent = count + ' / 50자';
    }

    if (titleInput && titleCount) {
      titleInput.addEventListener('input', updateCount);
      updateCount(); // 초기 표시
    }
  });

  // 삭제 확인 절차
  function confirmDelete() {
    var confirmation = prompt("삭제를 진행하려면 '삭제'라고 입력하세요:");
    if (confirmation === '삭제') {
      window.location.href = "<c:url value='/admin/notice/delete?id=${notice.id}'/>";
    } else {
      alert("삭제가 취소되었습니다.");
    }
  }
</script>
