# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  allow_browser versions: :modern
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  rescue_from ActiveRecord::RecordNotFound do
    render file: Rails.root.join("public/404.html"), status: :not_found, layout: false
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perfom this action"
    redirect_back(fallback_location: boards_path)
  end
end
