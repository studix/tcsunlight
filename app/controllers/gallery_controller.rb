class GalleryController < ApplicationController
  @albums
  def index
    @albums = PicasaWebAlbumFacade.get_albums
  end
end
