class ShorturlsController < ApplicationController
  def new
    @shorturl = Shorturl.new
  end

  def create
    if !params[:long_url].blank?
      
      client = Bitly.client
      @url = client.shorten(params[:long_url])
      @shorturl = Shorturl.new
      @shorturl.long_url = params[:long_url]
      @shorturl.short_url=@url.short_url
      @shorturl.save
      redirect_to shorturls_path
      
    end
  end

  def index
  end
end
