<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <meta name="description" content="펫GPT - 반려동물 용품 전문 쇼핑몰🐶🐱">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>펫GPT | ${!empty pageTitle ? pageTitle : '반려동물 용품 전문 쇼핑몰🐶🐱'}</title>

      <!-- Google Font -->
      <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet">

      <!-- Css Styles -->
      <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/font-awesome.min.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/elegant-icons.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/magnific-popup.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/nice-select.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/slicknav.min.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/style.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/dark-mode.css' />">
      <link rel="stylesheet" href="<c:url value='/css/header-custom.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/chat.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/home.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/shop_details.css'/>" type="text/css">
      <link rel="stylesheet" href="<c:url value='/css/shop.css'/>" type="text/css">

    </head>

    <body data-context-path="${pageContext.request.contextPath}"
      data-is-logged-in="${sessionScope.cust != null ? 'true' : 'false'}"
      data-cust-id="${sessionScope.cust != null ? sessionScope.cust.custId : ''}"
      data-cart-add-url="<c:url value='/cart/add/ajax'/>" data-login-url="<c:url value='/signin'/>">
      <!-- Page Preloder -->
      <div id="preloder">
        <div class="loader"></div>
      </div>

      <!-- Offcanvas Menu Begin -->
      <div class="offcanvas-menu-overlay"></div>
      <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
          <div class="offcanvas__links">
            <a href="<c:url value='/signin'/>">로그인</a>
            <a href="<c:url value='/signup'/>">회원가입</a>
          </div>
          <div class="offcanvas__top__hover">
            <span>Usd <i class="arrow_carrot-down"></i></span>
            <ul>
              <li>USD</li>
              <li>EUR</li>
              <li>USD</li>
            </ul>
          </div>
        </div>
        <div class="offcanvas__nav__option">
          <a href="#" class="search-switch"><img src="<c:url value='/img/icon/search.png'/>" alt=""></a>
          <a href="#"><img src="<c:url value='/img/icon/heart.png'/>" alt=""></a>
          <a href="#"><img src="<c:url value='/img/icon/cart.png'/>" alt=""> <span>0</span></a>
          <div class="price">$0.00</div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
          <p>반려동물 용품 전문 쇼핑몰🐶🐱</p>
        </div>
      </div>
      <!-- Offcanvas Menu End -->

      <!-- Header Section Begin -->
      <header class="header">
        <div class="header__top">
          <div class="container">
            <div class="row">
              <div class="col-lg-6 col-md-7">
                <div class="header__top__left">
                  <p>반려동물 용품 전문 쇼핑몰🐶🐱</p>
                </div>
              </div>
              <div class="col-lg-6 col-md-5">
                <div class="header__top__right">
                  <c:choose>
                    <c:when test="${sessionScope.cust.custId == null}">
                      <div class="header__top__links">
                        <a href="<c:url value='/signin'/>">로그인</a>
                        <a href="<c:url value='/signup'/>">회원가입</a>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <div class="header__top__links">
                        <a href="<c:url value='#'/>">${sessionScope.cust.custId}님, 안녕하세요!</a>
                        <a href="<c:url value='/mypage?id=${sessionScope.cust.custId}'/>">마이페이지</a>
                        <a href="<c:url value='/mypage/like?id=${sessionScope.cust.custId}'/>">찜</a>
                        <a href="<c:url value='/cart'/>">장바구니</a>
                      </div>
                    </c:otherwise>
                  </c:choose>
                  <div id="mode-select-wrapper" style="position: relative; margin-left: 20px;">
                    <span id="modeToggleBtn"
                      style="cursor: pointer; font-size: 14px; color: #ffffff; white-space: nowrap;">모드
                      선택 ▾</span>
                    <div id="modeOptions" class="mode-options">
                      <div data-mode="light" title="라이트 모드"><i class="fa fa-sun-o"></i></div>
                      <div data-mode="dark" title="다크 모드"><i class="fa fa-moon-o"></i></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-2 col-md-2">
              <div class="header__logo">
                <a href="/">
                  <img id="main-logo" src="<c:url value='/img/logo/logo.png'/>"
                    data-light-src="<c:url value='/img/logo/logo.png'/>"
                    data-dark-src="<c:url value='/img/logo/logo-dark.png'/>" alt="PetGPT Logo">
                </a>
              </div>
            </div>

            <div class="col-lg-4 col-md-4">
              <div class="header__search">
                <form action="<c:url value='/shop/search'/>" method="get">
                  <input type="text" name="keyword" placeholder="검색어를 입력하세요..." class="form-control search-input">
                  <button type="submit" class="search-btn">
                    <i class="fa fa-search"></i>
                  </button>
                </form>
              </div>
            </div>

            <div class="col-lg-6 col-md-6">
              <nav class="header__menu mobile-menu">
                <ul>
                  <li><a href="/">홈</a></li>
                  <li><a href="<c:url value='/shop'/>">카테고리</a></li>
                  <li><a href="<c:url value='/community'/>">커뮤니티</a></li>
                  <li><a href="#">고객지원</a>
                    <ul class="dropdown">
                      <li><a href="<c:url value='/qnaboard/add?id=${sessionScope.cust.custId}'/>">1:1 문의하기</a></li>
                      <li><a href="<c:url value='/ai-analysis'/>">AI 품종 분석</a></li>
                      <li><a href="<c:url value='/about'/>">about us</a></li>
                    </ul>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
          <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
      </header>
      <!-- Header Section End -->

      <!-- ========= Center Content Start ========= -->
      <main id="main-content">
        <c:choose>
          <c:when test="${!empty centerPage}">
            <jsp:include page="${centerPage}" />
          </c:when>
          <c:otherwise>
            <div style="text-align: center; padding: 50px; min-height: 400px;">
              <h2>페이지 내용을 준비 중입니다.</h2>
              <p>잠시만 기다려 주세요.</p>
              <a href="<c:url value='/'/>">홈으로 돌아가기</a>
            </div>
          </c:otherwise>
        </c:choose>
      </main>
      <!-- ========= Center Content End ========= -->

      <!-- Footer Section Begin -->
      <footer class="footer">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="footer__about">
                <div class="footer__logo">
                  <a href="#"><img src="<c:url value='/img/logo/logo-dark.png'/>" alt=""></a>
                </div>
              </div>
            </div>
            <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
              <div class="footer__widget">
                <h6>Shopping</h6>
                <ul>
                  <li><a href="#">Clothing Store</a></li>
                  <li><a href="#">Trending Shoes</a></li>
                  <li><a href="#">Accessories</a></li>
                  <li><a href="#">Sale</a></li>
                </ul>
              </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-6">
              <div class="footer__widget">
                <h6>Shopping</h6>
                <ul>
                  <li><a href="#">Contact Us</a></li>
                  <li><a href="#">Payment Methods</a></li>
                  <li><a href="#">Delivary</a></li>
                  <li><a href="#">Return & Exchanges</a></li>
                </ul>
              </div>
            </div>
            <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
              <div class="footer__widget">
                <h6>NewLetter</h6>
                <div class="footer__newslatter">
                  <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                  <form action="#">
                    <input type="text" placeholder="Your email">
                    <button type="submit"><span class="icon_mail_alt"></span></button>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12 text-center">
              <div class="footer__copyright__text">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                <p>Copyright ©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>2020
                  All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by
                  <a href="https://colorlib.com" target="_blank">Colorlib</a>
                </p>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              </div>
            </div>
          </div>
        </div>
      </footer>
      <!-- Footer Section End -->

      <!-- Search Begin -->
      <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
          <div class="search-close-switch">+</div>
          <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
          </form>
        </div>
      </div>
      <!-- Search End -->

      <!-- Floating Action Button & Chat Modal -->
      <div id="fab-container">
        <!-- Initial FAB (Chat Bubble) -->
        <button type="button" id="fab-open" class="fab-button">
          <img src="<c:url value='/img/chat.png'/>" alt="문의/상담">
          <span>문의/상담은 여기로!</span>
        </button>
        <!-- Close FAB (X Mark) - Initially Hidden -->
        <button type="button" id="fab-close" class="fab-button" style="display: none;">
          <img src="<c:url value='/img/close.png'/>" alt="닫기">
        </button>

        <!-- Chat Modal - Initially Hidden -->
        <div id="chat-modal" style="display: none;">
          <div class="chat-modal-header">
            <img src="<c:url value='/img/logo/logo2.png'/>" alt="PetGPT Logo" class="modal-logo">
            <span class="modal-title">PetGPT 실시간 상담</span>
          </div>
          <div class="chat-modal-body">

            <div id="chat-messages">
              <p class="initial-message">상담원 연결 중...</p>
            </div>
            <div class="chat-input-area">
              <input type="text" id="chat-input" placeholder="메시지를 입력하세요...">
              <button type="button" id="send-button">전송</button>
            </div>
          </div>
          <div class="chat-modal-footer">
            <button type="button" id="modal-chatbot-btn">챗봇</button>
            <button type="button" id="modal-livechat-btn">실시간 상담</button>
          </div>
        </div>
      </div>
      <!-- End Floating Action Button & Chat Modal -->

      <!-- Js Plugins -->
      <script src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>

      <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
      <script src="<c:url value='/js/jquery.nice-select.min.js'/>"></script>
      <script src="<c:url value='/js/jquery.nicescroll.min.js'/>"></script>
      <script src="<c:url value='/js/jquery.magnific-popup.min.js'/>"></script>
      <script src="<c:url value='/js/jquery.countdown.min.js'/>"></script>
      <script src="<c:url value='/js/jquery.slicknav.js'/>"></script>
      <script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
      <script src="<c:url value='/js/main.js'/>"></script>

      <!-- Web Socket Lib -->
      <script src="<c:url value=" /webjars/sockjs-client/sockjs.min.js" /> "></script>
      <script src="<c:url value=" /webjars/stomp-websocket/stomp.min.js" /> "></script>

      <!-- Global Variables & Config -->
      <script>
        // 전역 변수 선언 (모든 페이지 JS에서 접근 가능)
        const contextPath = document.body.dataset.contextPath || '';
        const isLoggedIn = document.body.dataset.isLoggedIn === 'true';
        const custId = document.body.dataset.custId || '';
        const globalCartAddUrl = document.body.dataset.cartAddUrl || '';
        const globalLoginUrl = document.body.dataset.loginUrl || '';

        // 채팅 관련 설정 (chat.js에서 사용)
        var chatUsername = "User_${sessionScope.cust != null ? sessionScope.cust.custId : 'Guest'}";
        var websocketUrl = 'http://127.0.0.1:8088/ws';
        var chatbotApiUrl = contextPath + '/api/chatbot/ask';

        // 디버깅 로그
        console.log("Global data from index.jsp:", { contextPath, isLoggedIn, custId, globalCartAddUrl, globalLoginUrl });
      </script>

      <!-- 공통 로직 JS -->
      <script src="<c:url value='/js/chat.js'/>"></script>
      <script src="<c:url value='/js/dark-mode.js'/>"></script>
      <script src="<c:url value='/js/shop.js'/>"></script>
      <script src="<c:url value='/js/home.js'/>"></script>

      <!-- 페이지별 JS 로드 (jQuery 및 공통 스크립트 로드 후) -->
      <c:choose>
        <c:when test="${viewName == 'login'}">
          <script src="<c:url value='/js/login.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'shop-details'}">
          <script src="<c:url value='/js/shop_details.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'shopping-cart'}">
          <script src="<c:url value='/js/shopping_cart.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'signup'}">
          <script src="<c:url value='/js/signup.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'community'}">
          <script src="<c:url value='/js/community.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'community_write'}">
          <!-- Summernote CSS -->
          <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
          <!-- Popper.js -->
          <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
          <!-- Bootstrap JS -->
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
          <!-- Summernote JS -->
          <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
          <!-- 페이지별 JS -->
          <script src="<c:url value='/js/community_write.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'community_edit'}">
          <!-- Summernote CSS -->
          <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
          <!-- Popper.js -->
          <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
          <!-- Bootstrap JS -->
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
          <!-- Summernote JS -->
          <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
          <!-- 페이지별 JS -->
          <script src="<c:url value='/js/community_edit.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'checkout'}">
          <script src="<c:url value='/js/checkout.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'mypage'}">
          <script src="<c:url value='/js/mypage.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'address'}">
          <script src="<c:url value='/js/address.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'address_add'}">
          <script src="<c:url value='/js/address_add.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'address_detail'}">
          <script src="<c:url value='/js/address_detail.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'coupon'}">
          <script src="<c:url value='/js/coupon.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'like'}">
          <script src="<c:url value='/js/like.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'order_detail'}">
          <script src="<c:url value='/js/order_detail.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'order'}">
          <script src="<c:url value='/js/order.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'pet'}">
          <script src="<c:url value='/js/pet.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'qnaboard'}">
          <script src="<c:url value='/js/qnaboard.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'recent_view'}">
          <script src="<c:url value='/js/recent_view.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'qnaboard_add'}">
          <script src="<c:url value='/js/qnaboard_add.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'qnaboard_detail'}">
          <script src="<c:url value='/js/qnaboard_detail.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'review'}">
          <script src="<c:url value='/js/review.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'review_add'}">
          <script src="<c:url value='/js/review_add.js'/>"></script>
        </c:when>
        <c:when test="${viewName == 'review_detail'}">
          <script src="<c:url value='/js/review_detail.js'/>"></script>
        </c:when>
      </c:choose>

    </body>

    </html>