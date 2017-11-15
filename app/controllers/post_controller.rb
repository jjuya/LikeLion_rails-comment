class PostController < ApplicationController
  
  # http://guides.rorlab.org/action_controller_overview.html
  before_action(:find_post, only: [:show, :edit, :update, :destroy])
  
  def index # 게시글 리스트
    @posts = Post.all
  end

  def new # 게시글 작성 form
  end

  def create # 작성된 게시글을 DB에 넣는 액션
    title = params[:title]
    content = params[:content]
    user_id = params[:user_id]
    
    Post.create(
      title: title,
      content: content,
      user_id: user_id
    )
    
    redirect_to '/'
  end

  def show # 게시글 상세보기
    @comments = @post.comments
  end
  
  def edit
    # render :nothing => true
  end
  
  def update
    @post.update(
      title: params[:title],
      content: params[:content]
    )
    
    redirect_to "/post/show/#{params[:id]}"
  end
  
  def destroy
    
    @post.destroy
    
    flash[:notice] = "#{params[:id]}번 글이 삭제 되었습니다."
    
    redirect_to '/'
  end
  
  def create_commnet # 게시글에 댓글 다는 액션
    post_id = params[:post_id]
    content = params[:content]
    
    Comment.create(
      post_id: post_id,
      content: content
    )
    
    redirect_to :back
  end
  
  private
  def find_post
    @post = Post.find(params[:id])
  end
end
