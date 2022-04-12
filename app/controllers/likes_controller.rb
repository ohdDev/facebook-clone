class LikesController < ApplicationController

  # POST /likes or /likes.json
  def create
    @like = current_user.likes.build(like_params)
    # @like = Like.new(like_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_to  root_url, notice: "Like was successfully created." }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to root_url
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def like_params
     
      params.require(:like).permit(:post_id)
    end
end
