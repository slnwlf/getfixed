class CommentsController < ApplicationController

	before_action :set_bike
  before_action :set_comment, except: [:new, :create]
  before_action :authorize, except: [:index, :show]

  def create
  	@comment = current_user.comments.new(comment_params)
    @bike.comments << @comment
    if @comment.save
      flash[:notice] = "Successfully added comment."
      redirect_to bike_path(@bike)
    else
      flash[:error] = @comment.errors.full_messages.join(", ")
      redirect_to bike_path(@bike)
    end
  end

  def edit
    unless current_user == @comment.user
      redirect_to bike_path(@bike)
    end
  end

  def update
    if current_user == @comment.user
      if @comment.update_attributes(comment_params)
        flash[:notice] = "Successfully updated comment."
        redirect_to bike_path(@bike)
      else
        flash[:error] = @comment.errors.full_messages.join(", ")
        redirect_to edit_bike_comment_path(@bike, @comment)
      end
    else
      redirect_to bike_path(@bike)
    end
  end

  def destroy
    #owner of bike and delete any comments tied to his bike
    if current_user == @bike.user or @bike.id == @comment.bike.id 
      @comment.destroy
      flash[:notice] = "Successfully deleted comment."
      redirect_to bike_path(@bike)
    else
      redirect_to bike_path(@bike)
    end
  end

private

	def comment_params
    params.require(:comment).permit(:content)
  end

  def set_bike
    bike_id = params[:bike_id]
    @bike = Bike.find(bike_id) # <<< this is slug id
  end

  def set_comment
    comment_id = params[:id]
    @comment = Comment.find_by_id(comment_id)
  end

end
