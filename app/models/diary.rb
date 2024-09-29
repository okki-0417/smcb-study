class Diary < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :okazu_title, presence: true, length: { maximum: 100 }
  validates :reputation_points, presence: true, numericality: { only_integer: true, in: 1..100 }
  validates :content, presence: true, length: { maximum: 1000 }

  belongs_to :creator_user, class_name: :User, foreign_key: :creator_user_id
end
