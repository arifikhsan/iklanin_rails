class Api::V1::AdController < Api::BaseController
  def ping
    render json: {message: 'pong'}
  end

  def all
    @ads = Ad.active.page(params[:page])
  end
end
