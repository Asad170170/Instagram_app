class PostsController <ApplicationController
  before_action :authenticate_user!

  def save_like
    @like=Like.new(post_id:params[:post_id],user_id: current_user.id )
    @post.user_id=current_user.id if user_signed_in?


        respond_to do |format|

          format.json{
            if @like.save
              {success:true}
            else
              {success:false}
            end
          }
        end
  end

  def post_params
    params.require(:post).permit(:caption ,images:[])
  end

end
