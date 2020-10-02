class Api::V1::UserDetailsController < Api::BaseController
  before_action :authorize_request
  before_action :set_user_detail

  def index
  end

  def update
    if @user_detail.update(user_detail_params)
      render json: @user_detail
    else
      render_error
    end
  end

  private

  def set_user_detail
    @user_detail = current_user.detail
  end

  def user_detail_params
    params.require(:user_detail).permit(
      :name,
      :phone_number,
      :whatsapp_phone_number,
      :address,
      :dob,
      :gender
    )
  end

  def render_error
    render json: {errors: @user_detail.errors.full_messages}, status: :unprocessable_entity
  end
end
