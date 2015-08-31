class PhotosController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @photos = @group.photos.to_a
    @photos.sort! {|a, b| b.created_at <=> a.created_at}
  end

  def new
  end

  def create
    @photo = Photo.create(url: params[:url], user_id: params[:user_id], group_id: params[:group_id])
    if @photo.save
      render json: @photo
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy

    redirect_to :back
  end

end
