# To deliver this notification:
#
# NewComment.with(post: @post).deliver_later(current_user)
# NewComment.with(post: @post).deliver_later(User.all)

class NewComment < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  def message
    t('.messge')
    # @post = Post.find(params[:comment][:post_id])
    # @comment = Comment.find(params[:comment][:id])
    # @user = User.find(@comment.user_id)
    # "#{@user.first_name} commented on #{@post.title.truncate(10)}"
  end

  def url
    
    root_path
  end
end
