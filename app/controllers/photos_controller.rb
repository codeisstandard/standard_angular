class PhotosController < ApplicationController
  def index
    @photos = if params[:keywords]
                 Photo.where('name like ?',"%#{params[:keywords]}%")
               else
                 Photo.all
               end
  end

  # GET /photo2s/new
  def new
    @photo = Photo.new
  end

  # POST /photo2s
  # POST /photo2s.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to "/photos/index.json", notice: 'Photo was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /photo2s/1
  # PATCH/PUT /photo2s/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to "/photos/index.json", notice: 'Photo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /photo2s/1
  # DELETE /photo2s/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to "/photos/index.json", notice: 'Photo2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:url, :name)
    end
end


