class PostsController < ApplicationController

  def index
  end
def new
  unless current_user
    redirect_to new_user_session_path
  end
  end
  def create
    current_user.posts.create(post_params)
  end

  private
    def post_params
      params.require(:post).permit(:property_type,:city, :bedroom,:comments, :picture)
    end
end
