class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @curr_user = User.find(current_user.id)
    end


end    