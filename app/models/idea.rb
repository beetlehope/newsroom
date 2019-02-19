class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :state
  has_many :comments, dependent: :destroy
  has_many :likes

  validates :name, presence: true
  validates :description, presence: true

  scope :state_id, ->(state_id) { where state_id: state_id }
  scope :outdated, -> { where("created_at < ?", 2.weeks.ago) }
end
