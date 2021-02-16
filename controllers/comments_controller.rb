class CommentsController < ApplicationController
  before_action :authenticate_user
  def create
    @comment=Comment.new
    @comment.user_id = @current_user.user_id
    @comment.post_id = params[:post_id]
    @comment.content = params[:content]
    if @comment.save
      flash[:notice]="コメントしました"
      redirect_to("/posts/#{@comment.post_id}")
    else
      flash[:notice]="何も書かないとコメントはできません"
      redirect_to("/posts/#{@comment.post_id}")
    end
  end
end
