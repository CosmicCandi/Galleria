class GalleriesController < ApplicationController

  def index
    @galleries = current_user.galleries.order(created_at: :desc)
    render "galleries/new"
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
