class GalleriesController < ApplicationController

  before_action :find_gallery, only: [:edit, :update]

  def index
    @galleries = current_user.galleries.order(created_at: :desc)
    render "galleries/form"
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)
    if @gallery.save
      flash[:success] = "New gallery,  #{@gallery.title}, created!"
      redirect_to :root
    else
      render :new
    end
  end

  def edit
  end

  def update
    @gallery = current_user.galleries.find(params[:id])
    if @gallery.update!(gallery_params)
      flash[:success] = "Gallery successfully edited!"
      redirect_to :root
    else
      render :new
    end
  end


  def destroy
    @gallery = current_user.galleries.find(params[:id])
    if @gallery.destroy!
      flash[:success] = "Gallery was successfully deleted."
      redirect_to :root
    else
      flash[:alert] = "Something went wrong."
    end
  end

  private

  def find_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:title, :description, :user_id)
  end

end
