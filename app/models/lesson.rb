class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :lesson_words
  has_many :words, through: :lesson_words
  enum status: [:doing, :finished]
  accepts_nested_attributes_for :lesson_words


  def score_cal
    score_cal = 0
    self.lesson_words.where.not(selected_answer:nil).each do |x|
      if x.word.answers.find(x.selected_answer).is_correct
        score_cal += 1
      end 
    end
    score_cal
  end
end
