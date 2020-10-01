class PostsController < ApplicationController

  def index
  end
def new
  unless current_user
    redirect_to new_user_session_path
  end
end
def create
end
end
