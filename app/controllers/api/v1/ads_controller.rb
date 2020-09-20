class Api::V1::AdsController < Api::BaseController
  before_action :authorize_request, only: [:create, :update, :destroy]
  before_action :set_ad, only: [:update, :show, :destroy]

  def index
    @ads = Ad.show_active.page(params[:page]).includes(:category, user: :user_detail, ad_images: {image_attachment: :blob})
  end

  def show
  end

  def create
    @ad = Ad.new
    @ad.category_id = ad_params[:category_id].to_i
    @ad.title = ad_params[:title]
    @ad.detail = ad_params[:detail]
    @ad.price = ad_params[:price]
    @ad.user = current_user
    @ad.time_start = Time.now
    @ad.time_end = Time.now + 30.days
    @ad.status = Ad.statuses[:published]

    return render_error unless @ad.save

    image_file_array = params[:image_file].values
    image_cover_array = params[:image_cover].values.map {|value| value.to_s.downcase == "true"}

    image_file_array.zip(image_cover_array).each do |file, cover|
      AdImage.create(ad_id: @ad.id, image: file, cover: cover)
    end

    if @ad.valid?
      render json: {message: 'created', data: @ad}, status: :created
    else
      render_error
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

  def render_error
    render json: {errors: @ad.errors.full_messages}, status: :unprocessable_entity
  end

  def ad_params
    params.permit!
    # params.require(:ad).permit(
    #   :category_id,
    #   :title,
    #   :detail,
    #   :price,
    #   images: []
    # )
  end
end
