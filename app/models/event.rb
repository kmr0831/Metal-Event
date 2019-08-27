class Event < ApplicationRecord
  mount_uploader :event_image, EventImageUploader
  belongs_to :category
  belongs_to :owner, class_name: "User"
  has_many :tickets
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  
  validates :name,       presence: true, length: { maximum: 50 }
  validates :place,      presence: true, length: { maximum: 100 }
  validates :content,    presence: true, length: { maximum: 1000 } 
  validates :start_time, presence: true
  validates :end_time,   presence: true
  
  def created_by?(user)
    return false unless user
    owner.id == user.id
  end
  
  # def like_user?(user)
  #   user.likes.find_by(user_id: user.id)
  # end
  
  def self.ransackable_attributes(auth_object = nil)
    %w(name start_time)
  end
  
  def self.ransackable_associations(auth_object = nil) 
    []
  end
end
