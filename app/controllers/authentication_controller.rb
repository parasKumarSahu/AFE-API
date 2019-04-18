class AuthenticationController < ApplicationController
  skip_before_action :authorize_request
  # POST /auth/login
  def login
    @user = User.find_by(email: params[:email], api_name: params[:api_name], plan: params[:plan])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      Rack::Attack.cache.store.write("current_user", @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     api_name: @user.api_name, plan: @user.plan }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password, :api_name, :plan)
  end
end