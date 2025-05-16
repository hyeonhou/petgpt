<%@ page pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <style>
      .site-btn>a {
        color: white;
      }

      #category {
        color: rosybrown;
      }

      #like_img {
        width: 150px;
        height: 150px;
      }

      #like_del_icon {
        color: black;
      }

      .discount-badge {
        color: white;
        background-color: darkred;
      }

      .img-box img {
        transition: transform 0.3s ease;
        width: 100%;
        height: 100%;
        border-radius: 5%;
      }

      .img-box img:hover {
        transform: scale(1.05);
      }

    </style>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb__text">
              <h4>Mypage</h4>
              <div class="breadcrumb__links">
                <a href="<c:url value='/'/>">Home</a>
                <a href="<c:url value='#'/>">마이페이지</a>
                <span>찜 목록</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Data for JS -->
    <div id="like-data" style="display: none;" data-context-path="${pageContext.request.contextPath}">
    </div>


    <section class="shop spad">
      <div class="container">
        <div class="row">
          <%-- 옆 사이드 바(마이페이지 카테고리) --%>
            <div class="col-lg-3">
              <div class="shop__sidebar">
                <div class="shop__sidebar__accordion">
                  <div class="accordion" id="accordionExample">
                    <div class="card">
                      <div class="card-heading">
                        <a data-toggle="collapse">나의 정보</a>
                      </div>
                      <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                        <div class="card-body">
                          <div class="shop__sidebar__categories">
                            <ul style="height:auto;">
                              <li><a href="<c:url value='/mypage?id=${cust.custId}'/>">회원정보</a></li>
                              <li><a href="<c:url value='/pet?id=#${cust.custId}'/>">나의 펫 정보</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card">
                      <div class="card-heading">
                        <a data-toggle="collapse">나의 쇼핑 정보</a>
                      </div>
                      <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                        <div class="card-body">
                          <div class="shop__sidebar__categories">
                            <ul style="height: auto;">
                              <li><a href="<c:url value='/checkout/orderlist?id=${cust.custId}'/>">주문내역</a></li>
                              <li><a href="<c:url value='/address?id=${cust.custId}'/>">배송지 목록</a></li>
                              <li><a href="<c:url value='/coupon?id=${cust.custId}'/>">보유 쿠폰</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card">
                      <div class="card-heading">
                        <a data-toggle="collapse">나의 활동</a>
                      </div>
                      <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                        <div class="card-body">
                          <div class="shop__sidebar__categories">
                            <ul style="height:auto;">
                              <li><a href="<c:url value='/mypage/view?id=${cust.custId}'/>"><strong
                                      id="category">최근 본 상품</strong></a></li>
                              <li><a href="<c:url value='/mypage/like?id=${cust.custId}'/>">찜 목록</a></li>
                              <li><a href="<c:url value='/qnaboard?id=${cust.custId}'/>">1:1문의</a></li>
                              <li><a href="<c:url value='/review?id=${cust.custId}'/>">내가 작성한 리뷰</a></li>
                            </ul>
                            <br /><br />
                            <button class="site-btn" id="logout_btn"><a href="<c:url value="
                                    /logout" />">로그아웃</a></button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

            </div>
            <%-- 회원 정보 --%>
              <div class="col-lg-9 container mt-3">
                <h4><strong>👀 최근 본 상품 </strong></h4>
                <p style="color:lightgray"><br>최대 50개까지 저장됩니다.<br><br></p><hr>
                  <c:forEach var="c" items="${views}">
                    <div class="row">
                      <div class="col-md-2 img-box">
                        <a href="<c:url value='/shop/details?itemKey=${c.itemKey}'/>">
                          <img src="<c:url value='/img/product/${c.item.itemImg1}'/>"/></a>
                      </div>
                      <div class="col-md-9">
                        <h6>${c.item.itemName}</h6>
                        <div class="product__price">
                          <c:if test="${c.item.itemSprice > 0 and c.item.itemSprice < c.item.itemPrice}">
                            <c:set var="discountRate" value="${100 - (c.item.itemSprice * 100 / c.item.itemPrice)}" />
                              <div class="price-container">
                                <span class="original-price" style="text-decoration: line-through;">
                                  <fmt:formatNumber value="${c.item.itemPrice}" pattern="#,###" />원
                                </span>
                                <div class="sale-info">
                                  <span class="sale-price">
                                    <fmt:formatNumber value="${c.item.itemSprice}" pattern="#,###" />원
                                  </span>
                                  <span class="discount-badge">
                                    <fmt:formatNumber value="${discountRate}" pattern="#" />%
                                  </span>
                                </div>
                              </div>
                          </c:if>
                          <c:if test="${!(c.item.itemSprice > 0 and c.item.itemSprice < c.item.itemPrice)}">
                            <div class="price-container">
                              <span class="sale-price">
                                <fmt:formatNumber value="${c.item.itemPrice}" pattern="#,###" />원
                              </span>
                            </div>
                          </c:if>
                        </div>
                      </div>
                      <div class="col-md-1">
                        <a href="#" onclick="recent_view.del(${c.viewKey})">
                          <i id="view_del_icon" class="fa fa-close" style="color:black;"></i>
                        </a>
                      </div>
                    </div>
                    <hr>
                  </c:forEach>
              </div>
        </div>
      </div>
    </section>
