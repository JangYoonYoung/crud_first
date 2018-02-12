class HomeController < ApplicationController
  def index
    # 테이블 전체를 보여주기
    @posts = Post.all
  end

  def new
  end

  def create #테이블에 채워넣기
    @post = Post.new #테이블의 한 행을 추가
    @post.title = params[:post_title] #post_title이라는 이름의 내용을 title 행 아래 저장
    @post.content = params[:post_content] #post_content이라는 이름의 내용을 content 행 아래 저장
    @post.save #테이블에 써준 내용을 모두 저장
    #.save 후 id가 부여됨
    
    redirect_to '/home/index' #작업이 완료되면 되돌아갈 페이지
  end
  
  def destroy
    #Post.destroy_all #전체 게시물 삭제
    #특정 게시물만 삭제하려면 id를 알아야함
    
    post = Post.find(params[:post_id]) #해당 id를 가진 게시물을 찾아라
    #컨트롤러 내에서만 필요하기 때문에 @를 붙이지 않아도 됨
    post.destroy
    
    redirect_to '/home/index'
  end
  
  def edit
    @post = Post.find(params[:post_id])
    #view 파일에서 작성한 코드를 보여주고 싶을 땐 @를 꼭 붙여야 함
  end
  
  def update
    post = Post.find(params[:post_id])
    post.title = params[:post_title]
    post.content = params[:post_content]
    
    post.save
    
    redirect_to '/home/index'
  end
end
