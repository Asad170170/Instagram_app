class PostsController <ApplicationController
  def new
    @post=Post.new
  end
  def show
  end
  def create
    @post=Post.new(post_params)

    if @post.save
      redirect_to users_path ,flash: { success: "post created"}
    else
      redirect_to new_post_path,flash: { danger:"post not created"}
    end
  end

  def post_params
    params.require(:post).permit(:caption ,images:[])
  end

end
