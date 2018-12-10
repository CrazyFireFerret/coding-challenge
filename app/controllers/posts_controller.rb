class PostsController < ApplicationController
  def index
    @post = Post.all
    if params[:search]
        @post = Post.search(params[:search])
    else
        @post = Post.all
    end

  end

  def new
	  @post = Post.new
  end

  def show
          @post = Post.find(params[:id])
  end



  def create
    @post = Post.new(post_params)
          if @post.save
                redirect_to @post
          else
                  render 'new'
          end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path

  end

  private
  def post_params
      params.require(:post).permit(:title, :body)
  end

  
end
