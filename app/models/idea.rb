class Idea < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	belongs_to :author, class_name: "User"
	belongs_to :state
	has_many :comments, dependent: :destroy
end
