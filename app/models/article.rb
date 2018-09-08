class Article < ApplicationRecord
    validates :user_id, presence: true
    validates :title, presence: true, length: {maximum: 50}
    validates :content, presence: true
    validates :category_id, presence: true 
    mount_uploader :thumbnail, ImageUploader 
    validate :thumbnail_size

    belongs_to :user
    belongs_to :category
    has_many :likes, dependent: :destroy
    has_many :notifications

    def next
        Article.order(created_at: :desc, id: :desc).where("created_at <= ? and id < ?", created_at, id).first
    end

    def previous
        Article.order(created_at: :desc, id: :desc).where("created_at >= ? and  id > ?", created_at, id).first
    end



    private

        def thumbnail_size
            if thumbnail.size > 5.megabytes
                errors.add(:thumbnail, "画像は5MB以下にしてください")
            end
        end

end
