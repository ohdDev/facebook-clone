class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show_profile
        
        @curr_user = User.find(params[:id])
        @user = @curr_user
        
        @post = Post.new
  
      @curr_user = User.find(params[:id])
      @followers = @curr_user.followers
      @reqs = Friend.where(followee_id: @curr_user.id, status: "accepted")
      @friends = []
      @reqs.each do |req|
          @friends.push(User.where(id: req.followee_id).first)
      end
  
      @friends = []
      @reqs.each do |req|
          @friends.push(@followers.where(id: req.follower_id).first)
      end
      
      @user_posts = Post.where(user_id: params[:id]).order(created_at: :desc).page(params[:page]).per(10)
       @posts = Post.where('user_id IN (?) OR user_id = ? OR user_id = ?',@friends, @friendss, @curr_user.id).order(created_at: :desc).page(params[:page]).per(10)
    
      @comment = Comment.new


      
    end

      
      def mark_notifications_as_read
        if current_user
          notifications_to_mark_as_read = @post.notifications_as_post.where(recipient: current_user)
          notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
        end
      end




end   