class LessonWord < ApplicationRecord
  belongs_to :lesson
  belongs_to :word

  def correct_ans
    self.word.answers.where(is_correct:true).first
  end
  def result
    if self.selected_answer == self.correct_ans.id
     "Correct!"
    else
     "Wrong! Correct answer is #{self.correct_ans.name}"
    end
  end
end
