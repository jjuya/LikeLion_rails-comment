class PostController < ApplicationController
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
    id = params[:id]
    
    @post = Post.find(id)
    
    @comments = @post.comments
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
end
