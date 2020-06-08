class ApplicationController < ActionController::Base
  before_action :basic_auth

  private


  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.dig(:base ,:name) && password == Rails.application.credentials.dig(:base ,:password)
    end
  end
end
