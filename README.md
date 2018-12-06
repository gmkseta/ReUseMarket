# 소프트웨어 공학 

## 동국대 ReUseMarket

* 2013111999 김성준

* 2014112048 김형우

* 2014112062 양준현

* 2013111987 허재

### 사용한 프레임워크

* Ruby On Rails 5.1.4
* Ruby 2.4.2 

### Gemfile

* mysql2 - 데이터베이스 연결
* devise - 회원 가입 , 로그인 등 유저
* carrierwave - 이미지 업로드 
* mini_magick - 이미지 썸네일 크롭 
* figaro - api key 셋팅을 프라이빗으로 
* pusher - 챗팅 ,알람 등 실시간 서비스
* fog-aws - aws s3에 이미지 업로드 
* ransack - 검색 , 필터 관련 쿼리 생성
* csv - csv파일 로부터 시드데이터 파싱
* kaminari - 페이지네이션
* font-awesome-rails - fa-icon사용
* jquery-ui-rails - jquery ui rails단에서 호출
* activeadmin - 어드민 페이지
* active_admin_theme - 어드민 페이지 테마
* exception_handler - 예외처리

### 셋팅 되어야하는 api key들 (설정 안할시 실행 안됨)

ReuseMarket/config/application.yml

```yml
#푸셔 관련
PUSHER_APP_ID: ""
PUSHER_KEY: ""
PUSHER_SECRET: ""
PUSHER_CLUSTER: ""
#S3관련
S3_ACC_KEY: ""
S3_SECACC_KEY: ""
# 청기와랩 문자 서비스 관련
SMS_APPID: ""
SMS_APIKEY: ""
SMS_SENDER: ""

#데이터베이스 비밀번호
YANG_PW: ""
```



### 기존 레일스 프로젝트 세팅 및 파악하기

- 프로젝트 git clone 후 bundle,  rake db:migrate rails s로 서버 키면 실행될꺼임

```bash
#이미지 업로드시 image magick 설치해야할 수도 있음
#ubuntu 서버에서
sudo apt-get update
sudo apt-get install imagemagick
```

- scheme.rb 를 통해 데이터베이스 구조 파악
- routes.rb 에서 주로 요청 처리를 하는 컨트롤러와 URL을 파악
- 서버에서 주요 기능들을 사용해보고 주소를 확인해서 어느 컨트롤러/액션에서 처리하고 있는지 라우팅을 통해 확인

### 홈페이지 주소

* http://35.243.116.58/

### 홈페이지 캡쳐

* 홈화면

![1_home](public/images/readme/1_home.png)

* 물품 리스트 화면

![2_index](public/images/readme/2_index.png)

* 물품 리스트 - filter 화면

![3_index_filter](public/images/readme/3_index_filter.png)

* 물품 리스트 - 물품 mouse over 화면

![4_index_hover](public/images/readme/4_index_hover.png)

* 물품 상세보기 화면

![5_show](public/images/readme/5_show.png)

* 물품 상세보기- 판매자 정보 화면

![6_show_seller](public/images/readme/6_show_seller.png)

* 물품 게시 화면

![7_new](public/images/readme/7_new.png)

* 거래 로그 화면

![8_log](public/images/readme/8_log.png)

* 로그인 화면

![9_login](public/images/readme/9_login.png)

* 내 정보창 - 거래 기록 화면

![9_my_trade_log](public/images/readme/9_my_trade_log.png)

* 내 정보창 - 게시 물품 화면

![10_my_item_log](public/images/readme/10_my_item_log.png)

* 내 정보창 - 내게 남겨진 리뷰

![12_trade_detail](public/images/readme/11_my_review.png)

* 거래 걸기 시 상세 화면 (판매자 & 거래 완료 상태임)

![12_trade_detail](public/images/readme/12_trade_detail.png)

* 거래 걸기시 상세 화면 (구매자 & 거래 완료상태임)

![13_trade_detail_customer](public/images/readme/13_trade_detail_customer.png)

* 거래 완료 후 구매자 측 리뷰작성

![14_trade_detail_review](public/images/readme/14_trade_detail_review.png)

* 거래 시 챗팅

![15_trade_chat](public/images/readme/15_trade_chat.png)

* 거래 / 물품 상세 화면에서의 신고 창

![16_chat_singo](public/images/readme/16_chat_singo.png)

* 어드민 페이지 로그인

![17_admin_login](public/images/readme/17_admin_login.png)

* 어드민 페이지 대시보드

![18_admin_dashboard](public/images/readme/18_admin_dashboard.png)

* 어드민 거래

![19_admin_trade](public/images/readme/19_admin_trade.png)

* 어드민 물품

![20_admin_item](public/images/readme/20_admin_item.png)

* 어드민 유저

![21_admin_user](public/images/readme/21_admin_user.png)

* 어드민 신고

![22_admin_singo](public/images/readme/22_admin_singo.png)

 

