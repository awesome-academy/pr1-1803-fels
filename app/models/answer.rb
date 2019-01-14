class Answer < ApplicationRecord
  belongs_to :word
  validates :name,  presence: true, uniqueness: true
end
