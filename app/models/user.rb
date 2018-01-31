class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :ideas
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def archive
  	self.update(archived_at: Time.now)  	
  end

  scope :not_archived, -> { where(archived_at: nil) }

  def likes?(idea)
  	idea.likes.where(user_id: id).any?		  	
  end
end
