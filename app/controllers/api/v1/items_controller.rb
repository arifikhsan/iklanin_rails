class Api::V1::ItemsController < Api::BaseController
  before_action :authorize_request, only: [:create, :update, :destroy, :me]
  before_action :set_item, only: [:edit, :update, :show, :destroy, :push]

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
    @item.time_end = Time.now + Setting.max_duration_free.days
    @item.status = Item.statuses[:published]

    return render_error unless @item.save

    image_name_array = params[:image_name].values
    image_detail_array = params[:image_detail].values
    image_file_array = params[:image_file].values
    image_cover_array = params[:image_cover].values.map {|value| value.to_s.downcase == "true"}

    image_name_array.length.times do |index|
      ItemImage.create do |item_image|
        item_image.item_id = @item.id
        item_image.name = image_name_array[index]
        item_image.detail = image_detail_array[index]
        item_image.image = image_file_array[index]
        item_image.cover = image_cover_array[index]
      end
    end

    if @item.valid?
      render json: {message: 'created', data: @item}, status: :created
    else
      render_error
    end
  end

  def edit
  end

  def update
    authorize @item
    # binding.pry
    @item.update(item_main_params)

    return render_error unless @item.save

    @item.images.where(id: removed_ids_params).delete_all if removed_ids_params.present?
    keep_image_params.each { |e| @item.images.where(id: e[:id]).update(e) } if keep_image_params.present?
    @item.images.create(added_image_params) if added_image_params.present?

    if @item.valid?
      render json: {message: 'updated', data: @item}
    else
      render json: {errors: @item.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @item

    @item.destroy
  end

  def me
    @items = current_user.items.latest.page(params[:page]).includes(:category)
  end

  def push
    @item.update(time_start: Time.now, time_end: Time.now + Setting.max_duration_free.days)
    @item.save
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

  def item_main_params
    {
      category_id: item_params[:category_id].to_i,
      title: item_params[:title],
      detail: item_params[:detail],
      price: item_params[:price],
    }
  end

  def removed_ids_params
    return if params[:removed_image_id].blank?

    params[:removed_image_id].values.map(&:to_i)
  end

  def keep_image_params
    return if params[:keep_image_id].blank?

    image_id_array = params[:keep_image_id].values.map(&:to_i)
    image_name_array = params[:keep_image_name].values
    image_detail_array = params[:keep_image_detail].values
    image_cover_array = params[:keep_image_cover].values.map {|value| value.to_s.downcase == "true"}

    arr = []
    image_id_array.length.times do |index|
      arr << {
        id: image_id_array[index],
        name: image_name_array[index],
        detail: image_detail_array[index],
        cover: image_cover_array[index]
      }
    end

    arr
  end

  def added_image_params
    return if params[:added_image_name].blank?

    image_name_array = params[:added_image_name].values
    image_file_array = params[:added_image_file].values
    image_cover_array = params[:added_image_cover].values.map {|value| value.to_s.downcase == "true"}
    image_detail_array = params[:added_image_detail].values

    arr = []
    image_name_array.length.times do |index|
      arr << {
        name: image_name_array[index],
        image: image_file_array[index],
        cover: image_cover_array[index],
        detail: image_detail_array[index],
      }
    end

    arr
  end
end
