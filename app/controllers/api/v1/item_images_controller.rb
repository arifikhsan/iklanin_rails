class Api::V1::AdImagesController < Api::BaseController
  before_action :authorize_request, only: [:create, :update, :destroy]
  before_action :set_item_image, only: [:update, :show, :destroy]

  def index
    @item_images = ItemImage.page(params[:page])
  end

  def show; end

  def create
    @item_image = ItemImage.new(item_image_params)

    if @item_image.save
      render json: {message: 'created', data: @item_image}, status: :created
    else
      render json: {errors: @item_image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    authorize @item_image

    @item_image.update(item_image_params)
    if @item_image.save
      render json: {message: 'updated', data: @item_image}
    else
      render json: {errors: @item_image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @item_image

    @item_image.destroy
  end

  private

  def set_item_image
    @item_image = ItemImage.find(params[:id])
  end

  def item_image_params
    params.permit(:item_id, :image, :cover)
  end
end
