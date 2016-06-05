class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_authenticated_user

  private

  def ensure_authenticated_user
    authenticate_user(cookies.signed[:user_id]) || redirect_to(new_session_url)
  end

  def authenticate_user(user_id)
    if authenticate_user = User.find_by(id: user_id)
      cookies.signed[:user_id] ||= user_id
      @current_user = authenticate_user
    end
  end

  def unauthenticate_user
    ActionCable.server.disconnect(current_user: @current_user)
    @current_user = nil
    cookies.delete(:user_id)
  end
end
