class LessonsController < ApplicationController
  def create
    @lesson = Lessson.new(lesson_params)
  end

  def index
  end

  def show
  end

  def update
  end

  private

  def lesson_params
    param.require(:lesson).permit(:id, :word_id, :user_id)
  end
end
