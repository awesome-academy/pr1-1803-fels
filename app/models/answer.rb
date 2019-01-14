class Answer < ApplicationRecord
  belongs_to :word
  validates :name,  presence: true
end
