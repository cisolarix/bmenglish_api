class PhotosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %w[create]

  def show
    load_photo
  end

  def create
    build_photo
    @photo.save
  end

  private

  def load_photo
    @photo = Photo.find params[:id]
  end

  def build_photo
    @photo = Photo.new
    @photo.attributes = photo_params
  end

  def photo_params
    params.fetch(:photo, {}).permit(:image)
  end
end
