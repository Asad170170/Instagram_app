class LikesController <ApplicationController
  before_action :authenticate_user!

  def save_like
    @like=Like.new(post_id:params[:post_id],user_id: current_user.id )
    @post_id=params[:post_id]
        respond_to do |format|
          format.js{
              if @like.save
                {success:true}
              else
                {success:false}
              end
            @post_likes=Post.find(@post_id).total_likes_count
            puts @post_likes
          }
        end
  end



end
