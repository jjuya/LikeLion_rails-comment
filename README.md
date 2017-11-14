# 4차 산업 선도 인력
AI 빅데이터 분석가 양성 과정
---

---

## Week 1: Ruby
- day 1 : [Ruby 입문](https://github.com/jjuya/LikeLion_class_Ruby/tree/master/1day_Ruby)
    * Ruby 기초
        - 랜덤 함수 : sample.rb
    * Ruby 활용 Scraping : Nokogiri, HTTParty
    * create file & rename file : File.open, File.rename
- day 2 : [Sinatra 입문](https://github.com/jjuya/LikeLion_sinatra)
    * Sinatra : http://www.sinatrarb.com/intro-ko.html
    * Sinatra 활용
        1) 점심 메뉴 추천 : hash
        2) 로또 번호 추천
        3) op.gg 스크래핑 : Nokogiri, HTTParty, logging(csv, http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html)
    * 서버 : Heroku
- day 3 : 
    1. [rails CRUD](https://github.com/jjuya/LikeLion_rails-crud)
        * rails 맛보기
            1) routing(routes.rb)
            2) controller 생성(``` rails g controller post ```) : app/controllers/post_controller.rb
            3) model 생성(``` rails g model post ```) : app/modles/post.rb, db/migrate/20171108022640_create_posts.rb, db/schema.rb
                - [rails_db](https://rails-crud-jjuya.c9users.io/rails/db) : https://github.com/igorkasyanchuk/rails_db
                - [Active Record](http://guides.rorlab.org/active_record_basics.html)
                    * ex) Post.all, Post.first, Post.last ..
                    * primary key를 정수값으로 자동 생성 : id
         * Create : create
                1) CSV
                2) ORM(데이터베이스를 사용했지만 사용하지 않은 것 처럼) : create
        * Read : show
        * destroy : destory
        * update : modify, update
        * Bootstrap을 이용한 CSS 맛보기
    2. [Ruby Test](https://github.com/jjuya/LikeLion_class_Ruby/tree/master/3day_Ruby)
        * block
        * Unit Test(잘 모르겠다)
            1) calculator.rb
            2) calculator_test.rb
        * RSpec : http://rspec.info/
- day 4 : 
    1. [rspec](https://github.com/jjuya/LikeLion_class_Ruby/tree/master/4day_RSpec)
        * 설치 : gem install rspec
        ``` ruby
        require 'rspec'
        ```
        * 실행 : rspec intro_spec.rb 
        * ruby_intro
            - reduce(:+) array의 원소를 더하면서 압축 : https://ruby-doc.org/core-2.1.0/Enumerable.html
            - %w, %q : https://simpleror.wordpress.com/2009/03/15/q-q-w-w-x-r-s/
            - .include? : https://apidock.com/ruby/String/include%3F
            - 정규 표현식
                * http://www.tutorialspoint.com/ruby/ruby_regular_expressions.htm
                * http://www.nextree.co.kr/p4327/
    2. [rails signUp](https://github.com/jjuya/LikeLion_rails-signUp)
        * user list
        * user create : 암호화(md5, 이제 뚫을 수 있다. 테스트에서만 사용할 것)
            - [MD5 Decrypter](http://www.md5online.org/)가 존재
        * user modify
        * user destroy
        * login
            - [session](http://guides.rubyonrails.org/security.html#sessions) : ``` session['key'] ```
- day 5:
    1. [rails lotto](https://github.com/jjuya/LikeLion_rails-lotto)
        * cf : http://konkuk.likelion.org/challenge-w3-lotto
        * lotto/index : 추천 버튼
        * lotto/show : ``` arr.sample(6) ```
        * lotto/api
            1) lotto API : http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=
            2) JSON 파싱
            ``` ruby
            require 'httparty'
            require 'json'

            response = HTTParty.get(uri)
            info = JSON.parse(response.body)
            ```
            3) Array 연산 : https://stackoverflow.com/questions/13558461/how-to-find-matching-values-in-ruby-array
            ``` ruby
            arr1 = [1, 2, 3, 4]
            arr2 = [1, 5, 4, 2]

            arr1 & arr2 #=> [1, 2, 4]
            ```
    2. [ASCII art](https://github.com/jjuya/LikeLion_rails-asciiart)
        * artii : https://github.com/miketierney/artii
            - gem 'artii'
            ```ruby
            require 'artii'
            a = Artii::Base.new(font:'사용할 폰트')
            a.asciify('바꿔줄 문자열')
            ```
            - http://patorjk.com/software/taag/#p=display&f=Doh&t=Type%20Something%20
            - font : http://www.figlet.org/fontdb.cgi

        * 개발을 위해 필요한 Gem
            1) gem 'rails_db'
            2) gem 'pry-rails' : https://github.com/rweng/pry-rails
            3) gem 'awesome_print' 
    3. [rails-asked](https://github.com/jjuya/LikeLion_rails-asked)
        * question : 질문을 받는 페이지와 보여주는 페이지(작성자를 입력안할 경우 익명으로 DB에 입력)
        * sign-up
        * login/logout
---

## Week 2: 
- day 1 : Model association
    1. [Simple Board](https://github.com/jjuya/LikeLion_rails-simple_board)
        1) Model, View and Controller
            * controller and view
                - post#index : 모든 게시글을 보여준다
                - post#new : 새로운 게시글을 만드는 form을 보여준다
                - post#create : new에서 쓴 게시글을 DB에 저장
                - post#show : /post/show/:id 해당하는 글 1개만 보여준다
                - post#moldify : 게시글을 수정할 수 있는 form을 보여 준다
                - post#update : moldify에서 서정된 글을 DB에 새로 저장
                - post#destroy : show에서 본 게시글을 삭제
                - user#index : 모든 유저를 보여준다
                - user#new : 회원가입
                - user#create : new에서 가입한 회원을 DB에 저장
                - user#show : /user/show/:id 해당하는 유저 1명만 보여준다
                - user#login : login form
                - user#login_process : 로그인 정보와 DB 유저 정보를 비교해 유저를 로그인시킨다
            * model
                - post : title(String), content(String)
                - user : email(String), password(String)
        3) model association
            * 1 User가 여러 Post를 가질 수 있다
            * Post들은 특정한 User에 속해야 한다.
            * 많은 쪽(N)이 속하는 곳의 id를 가지고 있다. → 외래키
                - orm : 통일된 문법
                - db/migrate/20171113004145_create_posts.rb
                ```ruby
                t.integer :user_id # 알아서 User로 변경
                ```
                - app/model/post.rb
                ```ruby
                belongs_to :user
                ```
                - app/model/user.rb
                ```ruby
                has_many :posts
                ```
                - 예
                ```ruby
                User.posts
                User.find(1).posts[0].title
                User.find(1).posts.last.title
                ```
            * 1 Post가 여러 Comment를 가질 수 있다
            * Comment들은 특정한 Post에 속해야 한다.
                - db/migrate/20171113004145_create_comments.rb
                ```ruby
                t.integer :post_id
                ```
                - app/model/post.rb
                ```ruby
                belongs_to :user
                has_many :comments
                ```
                - app/model/comment.rb
                ```ruby
                belongs_to :post
                ```
                - app/controllers/post_controller.rb
                ```ruby
                def show
                    input_id = params[:id]
                    
                    @post = Post.find(input_id)
                    
                    @comments = @post.comments
                end
                ```
    2. [Comment practice](https://github.com/jjuya/LikeLion_rails-comment)
    
- day 1 : Model association
    1. [Comment practice](https://github.com/jjuya/LikeLion_rails-comment)
        1) User controller 추가
            * form tag
            * labeltag
        2)  Bootstrap
            * grid : https://getbootstrap.com/docs/4.0/layout/grid/
            * alert
                - flash[:notice] : arlet 초록색 경고창
                - flash[:alert] : arlet 붉은색 경고창
            * navbar
                - render : http://guides.rubyonrails.org/layouts_and_rendering.html
                ```ruby
                render 'layouts/navbar'
                ```
            * table
        3) seeds.rb
            ```linux
            rake db:drop
            rake db:migriate
            rake db:seed
            ```
            - gem 'faker' : https://github.com/stympy/faker
        4) pagenation
            - kaminari : https://github.com/kaminari/kaminari
            - will\_paginate : https://github.com/mislav/will_paginate