class Api::V1::AdsController < Api::BaseController
  before_action :authorize_request, only: [:create, :update, :destroy]
  before_action :set_item, only: [:update, :show, :destroy]

  def index
    @items = Item.show_active.page(params[:page]).includes(:category, user: :user_detail, item_images: {image_attachment: :blob})
  end

  def show
  end

  def create
    @item = Item.new
    @item.category_id = item_params[:category_id].to_i
    @item.title = item_params[:title]
    @item.detail = item_params[:detail]
    @item.price = item_params[:price]
    @item.user = current_user
    @item.time_start = Time.now
    @item.time_end = Time.now + Setting.max_duration_free
    @item.status = Item.statuses[:published]

    return render_error unless @item.save

    image_file_array = params[:image_file].values
    image_cover_array = params[:image_cover].values.map {|value| value.to_s.downcase == "true"}

    image_file_array.zip(image_cover_array).each do |file, cover|
      ItemImage.create(item_id: @item.id, image: file, cover: cover)
    end

    if @item.valid?
      render json: {message: 'created', data: @item}, status: :created
    else
      render_error
    end
  end

  def update
    authorize @item

    @item.update(item_params)
    # @item.time_start = Time.now
    # @item.time_end = Time.now + 30.days
    # @item.status = Item.statuses[:published]

    if @item.save
      render json: {message: 'updated', data: @item}
    else
      render json: {errors: @item.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @item

    @item.destroy
  end

  private

  def set_item
    @item = Item.friendly.find(params[:id])
  end

  def render_error
    render json: {errors: @item.errors.full_messages}, status: :unprocessable_entity
  end

  def item_params
    params.permit!
  end
end
