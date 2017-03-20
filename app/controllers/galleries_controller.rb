class GalleriesController < ApplicationController

  def index
    @galleries = current_user.galleries.order(created_at: :desc)
    if @galleries.photos.count == nil
      @photo = Photo.new(photo_upload: "https://unsplash.it/300/300/?#{rand(1..1080)}", caption: "A random photo to start your gallery off")
    else
    @photo = @galleries.photos.order(created_at: :desc).first.photo_upload.versions[:thumb]
    render "galleries/new"
    end
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)
    if @gallery.save
      flash[:success] = "New gallery,  #{@gallery.title}, created!"
      render :index
    else
      render :new
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:title, :description, :user_id)
  end

end
