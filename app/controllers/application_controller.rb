class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :login_required
  helper_method :current_user

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.dig(:base ,:name) && password == Rails.application.credentials.dig(:base ,:password)
    end
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  def login_required
    redirect_to login_path unless current_user
  end
end
