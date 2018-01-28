class Comment < ApplicationRecord
  belongs_to :idea
  belongs_to :author, class_name: "User"
  validates :text, presence: true
  scope :persisted, -> { where.not(id: nil) }
end


