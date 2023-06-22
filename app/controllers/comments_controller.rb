class CommentsController < ApplicationController
    before_action :set_submission

    def create
        @comment = @category_submission.comments.create(comment_params)
        @comment.user = current_user
        @category = Category.find(@category_submission.category_id)

        if @comment.save
            flash[:notice] = "Comment created successfully"
            redirect_to category_submission_path(@category, @category_submission)
        else
            flash[:alert] = "Comment not found"
            redirect_to category_submission_path(@category_submission)
        end
    end

    def destroy
        @comment = @category_submission.comments.find(params[:id])
        @comment.destroy
        redirect_to submission_path(@category_submission)
    end

    private

    def set_submission
        @category_submission = CategorySubmission.find(params[:category_submission_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
