class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search]
      @posts = Post.where('title ILIKE ?', "%#{params[:search]}%").order('created_at DESC')
      @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
    elsif params[:tag]
      @posts = Post.tagged_with(params[:tag]).order('created_at DESC').page(params[:page]).per(5)
    else
      @posts = Post.all.order('created_at DESC').page(params[:page]).per(5)
    end
    @tags = Post.tag_counts_on(:tags)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post].permit(:title, :body))
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_list, :search)
  end
end
