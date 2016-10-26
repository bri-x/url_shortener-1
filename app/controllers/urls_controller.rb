class UrlsController < ApplicationController
  def index
  end

  def create
  	@url = Url.new(valid_params)
  	@url.short_url ||= SecureRandom.base64[0..8]

  	if @url.save
  	else
  		@errors = @url.errors
  	end
  	
  	redirect_to urls_path
  end

  def valid_params
  	params.require(:url).permit(:long_url)
  end
end
