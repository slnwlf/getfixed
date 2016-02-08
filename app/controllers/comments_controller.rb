class CommentsController < ApplicationController

	before_action :set_bike
  before_action :set_comment, except: [:new, :create]
  before_action :authorize

  def create
  	@comment = current_user.comments.new(comment_params)
    @bike.comments << @comment
    if @comment.save
      flash[:notice] = "Successfully added comment."
      redirect_to bikes_path
    else
      flash[:error] = @comment.errors.full_messages.join(", ")
      redirect_to bikes_path
    end
  end

  def edit
  
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
