class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
  end

  def create
    Tweet.create(
      content: params[:content]
    )
    
    redirect_to '/tweets/index'
  end

  def show
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    
    @tweet.update(
      content: params[:content]
    )
    
    flash[:notice] = "#{@tweet.id} 번 글이 수정되었습니다."
    
    redirect_to '/'
    
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    
    flash[:alert] = "#{@tweet.id} 번 글이 삭제되었습니다."
    
    @tweet.destroy
    
    redirect_to :root
  end
end
