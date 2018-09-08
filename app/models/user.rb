class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, foreign_key: "user_id", dependent: :destroy
  has_many :notifications, dependent: :destroy
end
