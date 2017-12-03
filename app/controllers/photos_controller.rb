class PhotosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %w[create]

  def create
    build_photo
    @photo.save
  end

  private

  def build_photo
    @photo = Photo.new
    @photo.attributes = photo_params
  end

  def photo_params
    params.fetch(:photo, {}).permit(:image)
  end
end
