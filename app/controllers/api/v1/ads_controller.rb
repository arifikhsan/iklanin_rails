class Api::V1::AdsController < Api::BaseController
  before_action :authorize_request, only: [:create, :update, :destroy]
  before_action :set_ad, only: [:update, :show, :destroy]

  def index
    @ads = Ad.active.page(params[:page]).includes(:category, :user, ad_images: {image_attachment: :blob})
  end

  def show
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.user = current_user
    @ad.time_start = Time.now
    @ad.time_end = Time.now + 30.days
    @ad.status = Ad.statuses[:published]

    if @ad.save
      render json: {message: 'created', data: @ad}, status: :created
    else
      render json: {errors: @ad.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    authorize @ad

    @ad.update(ad_params)
    @ad.time_start = Time.now
    @ad.time_end = Time.now + 30.days
    @ad.status = Ad.statuses[:published]

    if @ad.save
      render json: {message: 'updated', data: @ad}
    else
      render json: {errors: @ad.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @ad

    @ad.destroy
  end

  private

  def set_ad
    @ad = Ad.friendly.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(
      :category_id,
      :title,
      :detail,
      :price
    )
  end
end
