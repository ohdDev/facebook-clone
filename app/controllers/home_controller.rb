class HomeController < PostsController
    before_action :authenticate_user!

end
