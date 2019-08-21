class Event < ApplicationRecord
  mount_uploader :event_image, EventImageUploader
    belongs_to :owner, class_name: "User"
    has_many :tickets
    
    validates :name, length: { maximum: 50 }, presence: true
    validates :place, length: { maximum: 100 }, presence: true
    validates :content, length: { maximum: 1000 }, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    
    def created_by?(user)
       return false unless user
       owner.id == user.id
    end
    
    def self.ransackable_attributes(auth_object = nil)
      %w(name start_time)
    end
    
    def self.ransackable_associations(auth_object = nil) 
      []
    end
end
