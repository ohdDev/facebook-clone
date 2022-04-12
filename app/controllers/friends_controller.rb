class FriendsController < ApplicationController

    def index
        @curr_user = User.find(current_user.id)
        @followers = @curr_user.followers
        @followees = @curr_user.followees

        @all_followers=[]
        @followers.each do |follower|
            @all_followers.push(follower.id)
        end

        @all_followees=[]
        @followees.each do |followee|
            @all_followees.push(followee.id)
        end

        @users = User.where.not(id: @curr_user.id).where.not(id: @all_followers).where.not(id: @all_followees)

        # @followers.each do |follower|
        #     @users = User.where.not(id: follower.id).where.not(id: @curr_user.id)
        # end
        # @users = []
        # @followers.each do |follower|
        #     @users.push(@followers.where(id: req.follower_id).first)
        # end
    end

    def requests
        @curr_user = User.find(current_user.id)
        @friends = @curr_user.followers

        # @status = Friend.where(follower_id: params[:follower_id]).where(followee_id: current_user.id).first
        # Friend.where(follower_id: friend.id).where(followee_id: current_user.id).first.status
        # p "$$$$$$$$$$$$ ", @status
    end

    def confirm
        @curr_user = User.find(current_user.id)
        # @friend = @curr_user.followers.find(params[:id])
        @friend = Friend.find(params[:id])
        @friend.status = "accepted"
        @friend.save
        redirect_to request.referrer
    end

    def delete
        @curr_user = User.find(current_user.id)
        # @friend = @curr_user.followers.find(params[:id])
        @friend = Friend.find(params[:id])
        @friend.destroy
        redirect_to request.referrer
    end

    def list
        @curr_user = User.find(current_user.id)
        @followers = @curr_user.followers
        # @reqs = Friend.where(followee_id: current_user.id, status: "accepted")

        # @friends = []
        # @reqs.each do |req|
        #     @friends.push(@followers.where(id: req.follower_id).first)
        # end

        @reqs = Friend.where(follower_id: @curr_user.id).or(Friend.where(followee_id: @curr_user.id))
      
        @accepted_reqs = @reqs.where(status: "accepted") 
        p "Reqs++++", @accepted_reqs.each {|a| [a.id]}
        @friends = []
        @accepted_reqs.each do |req|
          if @curr_user.id == req.followee_id
            @friends.push(User.find_by(id: req.follower_id))
          elsif @curr_user.id == req.follower_id
            @friends.push(User.find_by(id: req.followee_id))
          end
        end


        
    
    end

    def block
        @curr_user = User.find(current_user.id)
        @friend = Friend.find(params[:id])
        @friend.status = "blocked"
        @friend.save
        redirect_to request.referrer
    end

    def add_friend
        @curr_user = User.find(current_user.id)
        @friend = Friend.create(follower_id: params[:follower_id],followee_id: params[:followee_id])

        # @friend = Friend.new(:follower_id => @curr_user.id ,
        #     :followee_id => Friend.find(params[:followee_id]))
        # @friend.save
        redirect_to request.referrer
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:follower_id,:followee_id,:status)
    end

end
