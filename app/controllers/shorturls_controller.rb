class ShorturlsController < ApplicationController
  def new
    @shorturl = Shorturl.new
  end

  def create
    if !params[:long_url].blank?
      regx = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
    if  (params[:long_url] =~ regx) 
      @shorturl = Shorturl.new
      client = Bitly.client
      @url = client.shorten(params[:long_url])
      
      @shorturl.long_url = params[:long_url]
      @shorturl.short_url=@url.short_url
      @shorturl.save
      redirect_to shorturls_path
    else
      flash[:error] = "invalid url"
      redirect_to new_shorturl_path
    end
    end
  end

  def index
    @shorturls = Shorturl.all
    
  end
  
end
