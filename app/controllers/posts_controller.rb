class PostsController < ApplicationController

  def index
    if params.has_key? "let"
      unless current_user
        redirect_to new_user_session_path
      else
        @let = true
        @posts = current_user.posts
      end
    else
      @let = false
      @posts = Post.all
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])

      @post.update(post_params)
      redirect_to posts_path("let" => true)
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      redirect_to posts_path("let" => true)
    end


def new
  @post = Post.new
  end
  def create
    current_user.posts.create(post_params)
    redirect_to posts_path("let" => true)
  end

  private
    def post_params
      params.require(:post).permit(:property_type,:city, :bedroom,:comments, :picture)
    end
end
