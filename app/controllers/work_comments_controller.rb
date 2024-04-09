class WorkCommentsController < ApplicationController

  def create
    work = Work.find(params[:work_id])
    @comment = current_user.work_comments.new(work_comment_params)
    @comment.work_id = work.id
    @comment.save
  end

  def destroy
    @comment = WorkComment.find(params[:id])
    @comment.destroy
  end

  private

  def work_comment_params
    params.require(:work_comment).permit(:comment)
  end
end
