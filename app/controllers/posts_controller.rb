class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
 

  # GET /posts or /posts.json
  def index
    @post = Post.new

    @curr_user = User.find(current_user.id)
    @followers = @curr_user.followers
    @reqs = Friend.where(followee_id: current_user.id, status: "accepted")
    @reqss = Friend.where(follower_id: current_user.id, status: "accepted")
    @friendss = []
    @reqss.each do |req|
        @friendss.push(User.where(id: req.followee_id).first)
    end

    @friends = []
    @reqs.each do |req|
        @friends.push(@followers.where(id: req.follower_id).first)
    end
    


     @posts = Post.where('user_id IN (?) OR user_id = ? OR user_id = ?',@friends, @friendss, current_user.id).order(created_at: :desc).page(params[:page]).per(10)
  

    # @posts = Post.all
    # @posts = Post.where('user_id IN (?)' , current_user.id).order(created_at: :desc)
  #  @posts = Post.where('user_id IN (?)' , current_user.id).order(:created_at)
    # @posts = Post.where('user_id IN (?) OR user_id = ?', current_user.followers, current_user.id).order(:created_at).page(params[:page]).per(5)
   
    @comment = Comment.new

  end

  # GET /posts/1 or /posts/1.json
  def show
    set_post
    @comment = Comment.new

    mark_notifications_as_read
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    # @post = Post.new(post_params)
   
    @post = current_user.posts.new(post_params)
    p @post.user_id

    respond_to do |format|
      if @post.save
        format.html { redirect_to request.referrer, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        
        format.html { redirect_to request.referer , notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content, :image, :user_id)
  
    end
    
    def mark_notifications_as_read
      if current_user
        notifications_to_mark_as_read = @post.notifications_as_post.where(recipient: current_user)
        notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
      end
    end
end
