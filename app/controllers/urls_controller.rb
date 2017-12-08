class UrlsController < ApplicationController

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    @url = Url.find(params[:id])
    redirect_to @url.long_url
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to urls_path, notice: 'Url was successfully created.' }

      else
        format.html { render :new }

      end
    end
  end



  private
    def url_params
      params.require(:url).permit(:long_url)
    end
end
