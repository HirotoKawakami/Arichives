class Photo < ApplicationRecord
    mount_uploader :image, PhotosUploader
end
