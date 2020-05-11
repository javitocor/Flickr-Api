class StaticPagesController < ApplicationController
  require 'flickraw'

  def index
    FlickRaw.api_key=Figaro.env.flickraw_api_key
    FlickRaw.shared_secret=Figaro.env.FLICKRAW_SHARED_SECRET
    @flickr_id = "188394191@N04" unless params[:flickr_id]
    @photos = flickr.people.getPhotos :user_id => @flickr_id, :extras => 'url_t'
  end

  private

    def static_params
      params.require(:flickr).permit(:flickr_id)
    end
end
