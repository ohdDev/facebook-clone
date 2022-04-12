class UsersController < ApplicationController
    before_action :set_user, only: %i[ edit update ]
    before_action :authenticate_user!


    def index
        @curr_user = User.find(current_user.id)
    end

    def new
      @group = Group.new
    end

    def edit
        @curr_user = User.find(current_user.id)
        @user = @curr_user
    end

    def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to profile_url(@user), notice: "User was successfully updated." }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end



  #       # POST /users or /users.json
  def create
    super
    if @user.save
      Setting.create(user_id: @user.id)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "You have succesfully signed up!"
    else
      render "new"
    end
  end
      


      private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :birthday,:username, :gender, :phone, :first_name,:last_name,:email_confirmation,:password, :password_confirmation, :picture,:setting)
    end



end    
