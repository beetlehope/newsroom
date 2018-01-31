class Idea < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	belongs_to :user
	belongs_to :state
	has_many :comments, dependent: :destroy
	has_many :likes
	scope :state_id, -> (state_id) { where state_id: state_id }
end
