class Activity < ApplicationRecord
  belongs_to :user

  enum action_type: [:follow, :unfollow, :start_lession, :finish_lession]

  def target_object
    if follow? || unfollow?
      return User.find self.object_id
    end
  end
end
