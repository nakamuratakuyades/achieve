class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content])
    if params[:back]
      render :new
      return
    end
    unless @post.valid?
      render :new
      return
    end

    if params[:send]
      @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
      return
    end
    render :confirm
  end
  
  def confirm
    @post = Post.new(params[:content])
    if @post.invalid?
      render :action => "confirm"
    else
      render :action => "new"
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  
end
