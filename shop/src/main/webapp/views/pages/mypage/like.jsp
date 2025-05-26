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

      #item-img {
        width: 120px;
        height: 120px;
        border-radius: 5%;
        object-fit: cover;
        transition: transform 0.3s ease;
      }

      #item-img:hover {
        transform: scale(1.05);
      }

      .like-item {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        margin-bottom: 1.5rem;
      }

      .like-img {
        flex: 0 0 120px;
        margin-right: 1rem;
      }

      .like-content {
        flex: 1;
      }

      .like-delete {
        flex: 0 0 auto;
        margin-left: auto;
        padding-left: 1rem;
      }

      .discount-badge {
        background-color: darkred;
        color: white;
        padding: 2px 6px;
        font-size: 14px;
        border-radius: 4px;
        margin-left: 5px;
        width: 50px;
        text-align: center;
      }

      .original-price {
        text-decoration: line-through;
        color: gray;
        font-size: 14px;
      }

      .sale-price {
        font-weight: bold;
        font-size: 16px;
      }

      @media (max-width: 576px) {
        .like-item {
          flex-direction: column;
          align-items: flex-start;
        }

        .like-img {
          margin-bottom: 0.5rem;
        }

        .like-delete {
          align-self: flex-end;
          margin-top: 0.5rem;
        }
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
                              <li><a href="<c:url value='/mypage/view?id=${cust.custId}'/>">최근 본 상품</a></li>
                              <li><a href="<c:url value='/mypage/like?id=${cust.custId}'/>"><strong
                                      id="category">찜 목록</strong></a></li>
                              <li><a href="<c:url value='/qnaboard?id=${cust.custId}'/>">1:1문의</a></li>
                              <li><a href="<c:url value='/review?id=${cust.custId}'/>">내가 작성한 리뷰</a></li>
                              <li><a href="<c:url value='/review/rest?id=${cust.custId}'/>">작성 가능한 리뷰</a></li>
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
              <h4><strong>💟 내가 찜한 상품 </strong></h4>
              <p style="color:lightgray"><br>최근 1년간 찜한 내역이 유지됩니다.<br><br></p>
              <hr>

              <c:forEach var="c" items="${items}">
                <div class="like-item">
                  <div class="like-img">
                    <a href="<c:url value='/shop/details?itemKey=${c.itemKey}'/>">
                      <img id="item-img" src="<c:url value='/img/product/${c.itemImg1}'/>" />
                    </a>
                  </div>

                  <div class="like-content">
                    <h6>${c.itemName}</h6>
                    <div class="product__price">
                      <c:choose>
                        <c:when test="${c.itemSprice > 0 and c.itemSprice < c.itemPrice}">
                          <c:set var="discountRate" value="${100 - (c.itemSprice * 100 / c.itemPrice)}" />
                          <span class="original-price">
                <fmt:formatNumber value="${c.itemPrice}" pattern="#,###" />원
              </span>
                          <span class="sale-price">
                <fmt:formatNumber value="${c.itemSprice}" pattern="#,###" />원
              </span>
                          <span class="discount-badge">
                <fmt:formatNumber value="${discountRate}" pattern="#" />%
              </span>
                        </c:when>
                        <c:otherwise>
              <span class="sale-price">
                <fmt:formatNumber value="${c.itemPrice}" pattern="#,###" />원
              </span>
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </div>

                  <div class="like-delete">
                    <a href="#" onclick="like.del(${c.itemKey}, '${sessionScope.cust.custId}')">
                      <i class="fa fa-close" style="color:black;"></i>
                    </a>
                  </div>
                </div>
                <hr>
              </c:forEach>
            </div>
<%--              <div class="col-lg-9 container mt-3">--%>
<%--                <h4><strong>💟 내가 찜한 상품 </strong></h4>--%>
<%--                <p style="color:lightgray"><br>최근 1년간 찜한 내역이 유지됩니다.<br><br></p><hr>--%>
<%--                <c:forEach var="c" items="${items}">--%>
<%--                  <div class="row">--%>
<%--                    <div class="col-md-2 img-box">--%>
<%--                      <a href="<c:url value='/shop/details?itemKey=${c.itemKey}'/>">--%>
<%--                      <img id="item-img" src="<c:url value='/img/product/${c.itemImg1}'/>"/></a>--%>
<%--                    </div>--%>
<%--                    <div class="col-md-9">--%>
<%--                      <h6>${c.itemName}</h6>--%>
<%--                      <div class="product__price">--%>
<%--                        <c:if test="${c.itemSprice > 0 and c.itemSprice < c.itemPrice}">--%>
<%--                          <c:set var="discountRate" value="${100 - (c.itemSprice * 100 / c.itemPrice)}" />--%>
<%--                          <div class="price-container">--%>
<%--                                <span class="original-price" style="text-decoration: line-through;">--%>
<%--                                  <fmt:formatNumber value="${c.itemPrice}" pattern="#,###" />원--%>
<%--                                </span>--%>
<%--                            <div class="sale-info">--%>
<%--                                  <span class="sale-price">--%>
<%--                                    <fmt:formatNumber value="${c.itemSprice}" pattern="#,###" />원--%>
<%--                                  </span>--%>
<%--                              <span class="discount-badge">--%>
<%--                                    <fmt:formatNumber value="${discountRate}" pattern="#" />%--%>
<%--                                  </span>--%>
<%--                            </div>--%>
<%--                          </div>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${!(c.itemSprice > 0 and c.itemSprice < c.itemPrice)}">--%>
<%--                          <div class="price-container">--%>
<%--                              <span class="sale-price">--%>
<%--                                <fmt:formatNumber value="${c.itemPrice}" pattern="#,###" />원--%>
<%--                              </span>--%>
<%--                          </div>--%>
<%--                        </c:if>--%>
<%--                      </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-md-1">--%>
<%--                      <a href="#" onclick="like.del(${c.itemKey}, '${sessionScope.cust.custId}')">--%>
<%--                        <i id="view_del_icon" class="fa fa-close" style="color:black;"></i>--%>
<%--                      </a>--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                  <hr>--%>
<%--                </c:forEach>--%>
<%--                <br /><br />--%>
<%--              </div>--%>
        </div>
      </div>
    </section>
