class FriendsController < ApplicationController

    def index
        @curr_user = User.find(current_user.id)
        @friends = @curr_user.followers
    end

end
