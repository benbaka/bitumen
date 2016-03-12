class FrontalsController < ApplicationController
  skip_before_action :require_login, only: [:home, :login]

  def landing_page
  end

  def login
    user = User.find_by(username: params[:frontal][:username])
    user = user.authenticate(params[:frontal][:password])
    if user
      log_in user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to blogs_path

    else
      flash[:danger] = "Invalid email/password combination"
      render 'home'
    end
  end

  def logout
    log_out
    redirect_to frontals_home_path
  end

  def home
    if logged_in?
      redirect_to blogs_path
    end
  end
end
