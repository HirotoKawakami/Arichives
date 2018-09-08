class PhotosController < ApplicationController
    before_action :authenticate_user!

    def create
        @photo = Photo.new(photo_params)
        if @photo.save
            respond_to do |format|
                format.html
                format.json
            end
        else
        end
    end

    private

        def photo_params
            params.require(:photo).permit(:image)
        end
end
