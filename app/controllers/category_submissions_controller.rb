class CategorySubmissionsController < ApplicationController
  before_action :find_category, only: [:show, :next_approve]
  after_action :create_comment, only: [:next_approve]

  def index
    @allcategories = CategorySubmission.all
  end

  def show
    @category = @category_submission.category
    @comments = @category_submission.comments.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CategorySubmissionPdf.new(@category_submission, @comments)
        send_data pdf.render, filename: "#{@category.id}",
          type: "application/pdf",
          disposition: "inline"
      end
    end
  end

  def next_approve
    @category = @category_submission.category
    next_level = current_user.pic? ? @category_submission.read_attribute_before_type_cast(:status) : @category_submission.read_attribute_before_type_cast(:status).next
    next_stage = CategorySubmission.update_stage(current_user, @category)
    publish = current_user.pic? ? true : false
    
    respond_to do |format|
      if @category_submission.update!(status: next_level, next_stage: next_stage, published: publish)
        format.html { redirect_to category_submission_path(@category, @category_submission), notice: "Submission was successfully published." }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @last_approval = User.find_by_email(@category.unit.email_approval_person)

    user_answers = {}

    params.each do |key, value|
      next unless key.start_with?('question_')
      question_id = key.split('_').last.to_i
      question = Question.find(question_id).name
      selected_answer = value
      user_answers[question] = selected_answer
      question = Question.find(question_id)
    end
    
    @category_submission = CategorySubmission.create(
      category: @category, user: current_user, 
      user_answers: user_answers, next_stage: current_user.id, last_approval: @last_approval.id)
    redirect_to category_submission_path(@category, @category_submission)
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category = CategorySubmission.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to home_index_path, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def find_category
    @category_submission = CategorySubmission.find(params[:id])
  end

  def category_submission_params
    params.required(:category_submission).permit(:category_id, :user_id, :last_approval, user_answer: {})
  end
  
  def create_comment
    new_comment = @category_submission.comments.build(body: comment_status(@category_submission), user_id: current_user.id)
    new_comment.save!
  end

  def comment_status(category_submission)
    if category_submission.supervisor?
      "Apply"
    else category_submission.pic?
      "Approve by #{current_user.full_name}"
    end
  end
end