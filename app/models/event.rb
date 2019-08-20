class Event < ApplicationRecord
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
end
