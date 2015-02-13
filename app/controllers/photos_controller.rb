class PhotosController < ApplicationController
  def index
    @photos = if params[:keywords]
                 Photo.where('name ilike ?',"%#{params[:keywords]}%")
               else
                 []
               end
  end
end
