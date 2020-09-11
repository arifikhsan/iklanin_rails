class Api::V1::AdImagesController < Api::BaseController
  before_action :authorize_request, only: [:create, :update, :destroy]
  before_action :set_ad_image, only: [:update, :show, :destroy]

  def index
    @ad_images = AdImage.page(params[:page])
  end

  def show; end

  def create
    @ad_image = AdImage.new(ad_image_params)

    if @ad_image.save
      render json: {message: 'created', data: @ad_image}, status: :created
    else
      render json: {errors: @ad_image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    authorize @ad_image

    @ad_image.update(ad_image_params)
    if @ad_image.save
      render json: {message: 'updated', data: @ad_image}
    else
      render json: {errors: @ad_image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @ad_image

    @ad_image.destroy
  end

  private

  def set_ad_image
    @ad_image = AdImage.find(params[:id])
  end

  def ad_image_params
    params.permit(:ad_id, :image, :cover)
  end
end
