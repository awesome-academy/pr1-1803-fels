class Word < ApplicationRecord
  has_many :lesson_words
  has_many :answers
  belongs_to :category
  scope :learned, -> { where(learned: true) }
  scope :not_learned, -> { where(learned: false) }
  scope :category_id, ->(category_id) {
    where category_id: category_id if category_id.present?
  }
  validates :name,  presence: true, uniqueness: true
  accepts_nested_attributes_for :answers
  validate :check_answers

  def find_answers
    self.answers.find_by is_correct: true
  end

  private

  def check_answers
    answers = self.answers.reject {|word_answer| word_answer.marked_for_destruction?}
    if answers.combination(2).any? {|a1, a2| a1.name == a2.name}
      self.errors.add :base, "Answers can not be the same!"
    elsif answers.count {|answer| answer.is_correct?} != 1
      self.errors.add :base, "Only one correct answer is accepted!"
    end
  end
  
end
