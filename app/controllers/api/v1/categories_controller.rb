class Api::V1::CategoriesController < Api::BaseController
  before_action :authorize_request
  before_action :set_item, only: [:update, :show, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: {message: 'created', data: @category}, status: :created
    else
      render_error
    end
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render_error
    end
  end

  def destroy
    @category.destroy
  end

  private

  def set_item
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def render_error
    render json: {errors: @category.errors.full_messages}, status: :unprocessable_entity
  end
end
