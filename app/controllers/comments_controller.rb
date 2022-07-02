class CommentsController <ApplicationController
  before_action :authenticate_user!
  # before_create :set_user
  def create

    @comment=Comment.new(comment_params)
    if @comment.save!
      redirect_to users_path ,flash: { success: "comment posted."}
    else
      redirect_to users_path,flash: { danger:"comment was not posted! "}
    end
  end

  def comment_params
    params.require(:comment).permit(:comment ,:post_id,:user_id)
  end

  # private
  # def set_user
  #   @comment
  # end

end
