class Guest < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :notifications, foreign_key: "notified_by_id", dependent: :destroy
end
