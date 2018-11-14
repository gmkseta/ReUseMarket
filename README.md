# README

- 에디터는 아톰  <http://atom.io/>

- 플러그인 : atom-beautify, emmet, rails-snippets , rails-snippets


*  ruby 2.4.2 ,  rails 5.1.4 사용함
* rbenv를 이용해서 설치 ( 구글링 )



### 기존 레일스 프로젝트 세팅 및 파악하기

* ##### 먼저 mysql설치 하고 비밀번호를 MYSQL_PASS 로 환경변수 만들어 놓아야함

  * development 로 실행할때 임
  * 아니면 database.yml를 바꿔야함.
  * 따로 그냥 물어보셈

- 프로젝트 git clone 후 bundle, rake db:create, rake db:migrate rails s로 서버 구동시도
- scheme.rb 를 통해 데이터베이스 구조 파악
- routes.rb 에서 주로 요청 처리를 하는 컨트롤러와 URL을 파악
- 서버에서 주요 기능들을 사용해보고 주소를 확인해서 어느 컨트롤러/액션에서 처리하고 있는지 라우팅을 통해 확인
- Gemfile에서 사용하고 있는 젬 리스트를 확인



## gem

* active_admin(어드민)
* devise(로그인)
*  mysql2(데이터베이스)
* carrierwave(파일 업로드)
