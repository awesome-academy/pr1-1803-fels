class LessonsController < ApplicationController
before_action :logged_in_user, :verify_normal

  def create
    user_id = current_user.id
    @category = Category.find_by(id: params[:category_id])
    @words = @category.words.order("RANDOM()").limit(5)
    if @words.count <5
      flash[:danger] = "There is not enough words(5) to create lesson!"
      redirect_to category_path(@category)
    else
      @lessons_count = Lesson.count
      @lesson = @category.lessons.create!(name:  "Lessons #{@lessons_count+1}",
        user_id: user_id)
      @words.each do |word|
        @lesson.lesson_words.create(word_id: word.id)
      end
      redirect_to @lesson
    end
  end

  def update
    @lesson = Lesson.find_by id: params[:id]
    @lesson.update! lesson_params
    redirect_to @lesson
  end

  def show
    @lesson = Lesson.find_by id: params[:id]
    if @lesson.nil?
      redirect_to categories_url
    else
      @category = @lesson.category
    end
  end

  private

  def lesson_params
    param.require(:lesson).permit(:id, :word_id, :user_id)
    params[:lesson][:status] = 1
    params.require(:lesson).permit :status, lesson_words_attributes: [:id,:selected_answer]
  end
end
