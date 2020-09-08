class Api::V1::AdsController < Api::BaseController
  def ping
    render json: {message: 'pong'}
  end

  def index
    @ads = Ad.active.page(params[:page])
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
