class FriendsController < ApplicationController

    def index
        @curr_user = User.find(current_user.id)
        @friends = @curr_user.followers
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
        @reqs = Friend.where(followee_id: current_user.id, status: "accepted")

        @friends = []
        @reqs.each do |req|
            @friends.push(@followers.where(id: req.follower_id).first)
        end
    
    end

    def block
        @curr_user = User.find(current_user.id)
        @friend = Friend.find(params[:id])
        @friend.status = "blocked"
        @friend.save
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
