class ApplicationController < ActionController::Base
  before_action :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  include SessionsHelper

  after_filter :flash_headers

  def flash_headers
    # This will discontinue execution if Rails detects that the request is not
    # from an AJAX request, i.e. the header wont be added for normal requests
    return unless request.xhr?

    # Add the appropriate flash messages to the header, add or remove as
    # needed, but I think you'll get the point
    response.headers['x-flash'] = flash[:error]  unless flash[:error].blank?
    response.headers['x-flash'] = flash[:notice]  unless flash[:notice].blank?
    response.headers['x-flash'] = flash[:warning]  unless flash[:warning].blank?

    # Stops the flash appearing when you next refresh the page
    flash.discard
  end


  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to frontals_home_url
    end
  end
end
