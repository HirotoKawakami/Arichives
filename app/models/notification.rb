class Notification < ApplicationRecord
    belongs_to :user
    belongs_to :article
    belongs_to :guest, foreign_key: "notified_by_id"
end
