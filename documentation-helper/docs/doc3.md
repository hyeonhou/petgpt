# 펫GPT 상품 정보 및 연관 데이터 (벡터스토어용) - Part 2

## 상품 ID: 13 - 고양이 후드티

- **카테고리 ID:** 1 (고양이 옷/악세사리)
- **상품명:** 고양이 후드티
- **기본 설명:** 포근한 스타일의 고양이 후드
- **가격:** 25,000원
- **할인가:** 22,900원
- **총 재고 (옵션 통합):** 90개
- **대표 이미지:** cat_hoodie.png
- **등록일:** (DML 기준 NOW() - INTERVAL 17 DAY)

### 상세 설명 (item_details)

- (이 상품에 대한 상세 설명(item_details) 정보가 DML에 없습니다.)

### 옵션 정보

- **옵션 ID: 16** | 이름: S / 레드 | 사이즈: S | 색상: 레드 | 재고: 5 | 추가금액: 0원
- **옵션 ID: 17** | 이름: S / 블랙 | 사이즈: S | 색상: 블랙 | 재고: 5 | 추가금액: 0원
- **옵션 ID: 18** | 이름: M / 레드 | 사이즈: M | 색상: 레드 | 재고: 5 | 추가금액: 0원
- **옵션 ID: 19** | 이름: M / 블랙 | 사이즈: M | 색상: 블랙 | 재고: 5 | 추가금액: 0원

### 고객 리뷰 및 Q&A (QnABoard)

- **Q&A (qna_board_key: 3)**
  - **상품 ID(item_key):** 13
  - **주문번호(order_key):** (없음, 상품 문의)
  - **게시판 타입:** 1 (문의)
  - **작성자 ID:** user01 (김민준, 민준이)
  - **제목:** 고양이 후드티 사이즈 문의
  - **작성일:** (DML 기준 NOW() - INTERVAL 2 DAY)
  - **내용:** 저희 냥이가 5kg인데 M사이즈 괜찮을까요? 상세 사이즈표가 좀 더 자세했으면 좋겠습니다.
  - **문의 이미지:** (없음)
  - **구매 옵션:** (없음)
  - **답변 상태:** 0 (미답변, DML에는 관리자 댓글이 있지만 board_re는 0으로 되어 있음. 관리자 댓글 정보는 아래 '관리자 댓글' 섹션에 포함)
  - **별점:** (없음)
  - **관리자 댓글 (admin_comments):**
    - **댓글 ID(adcomments_key):** 1
    - **관리자 ID:** admin1 (관리자홍)
    - **내용:** 안녕하세요, 고객님. 문의주신 고양이 후드티의 경우, 5kg 냥이라면 M사이즈가 적당할 것으로 예상됩니다. 다만, 체형에 따라 차이가 있을 수 있으니 가슴둘레와 등길이를 측정 후 상세페이지 하단 사이즈표와 비교해보시는 것을 권장드립니다. 감사합니다.
    - **작성일:** (DML 기준 NOW() - INTERVAL 1 DAY)

### 커뮤니티 게시판 언급 (`communityboard` 테이블)

- **게시글 ID(board_key):** 2 (DML에서 커뮤니티 보드 첫 번째 게시글 다음에 오는 게시글 기준, 실제 board_key 값은 다를 수 있음)
  - **작성자 ID:** catlover01 (김고양, 냥이짱)
  - **카테고리:** 펫자랑
  - **제목:** 우리 냥이 새 후드티! 펫GPT에서 득템했어요 💖
  - **내용:** 펫GPT에서 새로 산 고양이 후드티! 부들부들한 재질에 디자인도 너무 귀여워서 바로 질렀어요. 우리 냥이도 마음에 드는지 입고 잘 돌아다니네요. 집사님들께 강추!
  - **이미지:** /img/product/cat_hoodie.png
  - **조회수:** (DML 기준 RAND() \* 520) + 60
  - **좋아요 수:** 0 (초기값)
  - **댓글 수:** 0 (초기값, 실제 댓글은 아래 '커뮤니티 댓글' 섹션에 포함)
  - **등록일:** (DML 기준 NOW() - INTERVAL FLOOR(RAND()\*10) DAY - INTERVAL 2 HOUR)
  - **커뮤니티 댓글 (`comments` 테이블, pboard_key가 위 게시글 ID와 일치하는 경우):**
    - **댓글 ID(comments_key):** 4 (DML에서 comments 테이블의 네 번째 INSERT 기준, 실제 key 값은 다를 수 있음)
      - **작성자 ID:** mintycat
      - **내용:** 후드티 너무 예뻐요! 어디서 사셨는지 정보 좀 알 수 있을까요?
      - **작성일:** (DML 기준 NOW() - INTERVAL 9 DAY)
      - **부모 댓글 ID:** (없음, depth 0)
    - **댓글 ID(comments_key):** 5
      - **작성자 ID:** dogleader
      - **내용:** 냥이한테 정말 잘 어울리네요! 모델 같아요.
      - **작성일:** (DML 기준 NOW() - INTERVAL 9 DAY + INTERVAL 1 HOUR)
      - **부모 댓글 ID:** (없음, depth 0)
    - **댓글 ID(comments_key):** 6
      - **작성자 ID:** admin1
      - **내용:** 고객님, 소중한 후기 감사합니다! 냥이가 정말 귀엽네요. ^^
      - **작성일:** (DML 기준 NOW() - INTERVAL 9 DAY + INTERVAL 2 HOUR)
      - **부모 댓글 ID:** 5 (dogleader 댓글에 대한 대댓글, depth 1)

### 이 상품을 좋아한 고객 (`like` 테이블)

- (이 상품에 대한 좋아요 정보가 DML에 없습니다.)

### 주문 정보 (`total_order`, `order_detail` 테이블)

- **주문번호(order_key):** 3
  - **고객 ID:** user01
  - **쿠폰 ID:** (없음)
  - **주문일:** (DML 기준 NOW() - INTERVAL 3 DAY)
  - **수령인:** 김민준, 010-1212-1212
  - **요청사항:** 조심히 다뤄주세요.
  - **주문상태:** 배송완료
  - **결제수단:** 현대카드
  - **총 결제금액:** 21,900원 (DML 상의 금액)
  - **배송지:** 서울특별시 용산구 용산대로 123, 505호 (04321)
  - **주문 상세:**
    - **상품 ID: 13 (고양이 후드티)**, 옵션 ID: 16 (S / 레드, DML에서 option_key=13으로 되어있으나, 13번 상품의 옵션 ID는 16부터 시작. 여기서는 16번 옵션으로 가정), 주문가격: 22,900원, 수량: 1
    - _(이 주문에는 다른 상품(item_key: 70)도 포함되어 있음)_

### 최근 본 고객 (`recent_view` 테이블)

- (이 상품을 최근 본 고객 정보가 DML에 없습니다.)

---

## 상품 ID: 14 - 고양이 왕관 머리띠

- **카테고리 ID:** 1 (고양이 옷/악세사리)
- **상품명:** 고양이 왕관 머리띠
- **기본 설명:** 생일파티 전용 머리띠
- **가격:** 11,000원
- **할인가:** 9,500원
- **총 재고 (옵션 통합):** 110개
- **대표 이미지:** cat_crown.jpeg
- **등록일:** (DML 기준 NOW() - INTERVAL 16 DAY)

### 상세 설명 (item_details)

- (이 상품에 대한 상세 설명(item_details) 정보가 DML에 없습니다.)

### 옵션 정보

- **옵션 ID: 20** | 이름: FREE / 골드 | 사이즈: FREE | 색상: 골드 | 재고: 5 | 추가금액: 0원
- **옵션 ID: 21** | 이름: FREE / 실버 | 사이즈: FREE | 색상: 실버 | 재고: 5 | 추가금액: 0원

### 고객 리뷰 및 Q&A (QnABoard)

- (이 상품에 대한 리뷰나 Q&A 정보가 DML에 없습니다.)

### 이 상품을 좋아한 고객 (`like` 테이블)

- (이 상품에 대한 좋아요 정보가 DML에 없습니다.)

### 주문 정보 (`total_order`, `order_detail` 테이블)

- (이 상품에 대한 주문 정보가 DML에 없습니다.)

### 최근 본 고객 (`recent_view` 테이블)

- (이 상품을 최근 본 고객 정보가 DML에 없습니다.)

---

## 상품 ID: 30 - 고양이 자동급식기

- **카테고리 ID:** 2 (고양이 급식기/급수기)
- **상품명:** 고양이 자동급식기
- **기본 설명:** 시간 설정 가능한 자동 급식기
- **가격:** 47,000원
- **할인가:** 43,900원
- **총 재고 (옵션 통합):** 70개
- **대표 이미지:** cat_autofeeder.jpg
- **등록일:** (DML 기준 NOW() - INTERVAL 20 DAY)

### 상세 설명 (item_details)

- (이 상품에 대한 상세 설명(item_details) 정보가 DML에 없습니다.)

### 옵션 정보

- **옵션 ID: 45** | 이름: 화이트 | 사이즈: FREE | 색상: 화이트 | 재고: 5 | 추가금액: 0원
- **옵션 ID: 46** | 이름: 민트 | 사이즈: FREE | 색상: 민트 | 재고: 5 | 추가금액: 0원

### 고객 리뷰 및 Q&A (QnABoard)

- (이 상품에 대한 리뷰나 Q&A 정보가 DML에 없습니다.)

### 이 상품을 좋아한 고객 (`like` 테이블)

- (이 상품에 대한 좋아요 정보가 DML에 없습니다.)

### 주문 정보 (`total_order`, `order_detail` 테이블)

- (이 상품에 대한 주문 정보가 DML에 없습니다.)

### 최근 본 고객 (`recent_view` 테이블)

- (이 상품을 최근 본 고객 정보가 DML에 없습니다.)

---
