class Like < ApplicationRecord
    belongs_to :guest
    belongs_to :article, counter_cache: :likes_count
    validates :guest_id, presence: true
    validates :article_id, presence: true
end
