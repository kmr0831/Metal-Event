class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :create_events, class_name: "Event", foreign_key: :owner_id
  has_many :tickets
  has_many :likes, dependent: :destroy
  has_many :like_events, through: :likes, source: :event
end
