class PhotosController < ApplicationController

  before_action :current_user
  before_action :find_gallery
  before_action :find_photo, only: [:show, :destroy]

  def index
    @photos = current_user.photos.order(created_at: :desc)
    unless @current_user
      flash[:danger] = "You must be logged in to do this!"
    end
  end

  def new
    @gallery = find_gallery
    @photo = Photo.new
    render :upload
  end

  def create
    @gallery = find_gallery
    @photo = @gallery.photos.new(photo_params)
    if @photo.save!
      redirect_to :root
    else
      render :upload
    end
  end

  def show
  end

  def destroy

  end

  private

  def find_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:photo_upload, :photo_id, :caption, :user_id, :gallery_id)
  end


end
