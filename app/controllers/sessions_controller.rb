class SessionsController < ApplicationController
  skip_before_action :ensure_authenticated_user, only: %i( new create )

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      authenticate_user(user.id)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    unauthenticate_user
    redirect_to new_session_url
  end
end
