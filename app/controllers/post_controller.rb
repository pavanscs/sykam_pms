class PostController < ApplicationController
  def new
    # code to render new view
  end

  def create
    # code to create
  end

  def edit
    # code to render edit
  end

  def update
    post = current_user.posts.find(params[:id])
    authorize post
    if post.update(post_params)
      redirect_to post
    else
      render :edit
    end
  end

  def show
    # code to render show
  end
  #The index action will show only published posts unless the user is an admin.
  def index
    policies = policy_scope(Post)
    # code to render index
  end

  def post_params
    params.require(:post).permit(policy(@post).permitted_attributes)
  end

end



