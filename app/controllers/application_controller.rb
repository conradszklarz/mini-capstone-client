class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def set_headers
    if session[:jwt]
      @jwt = session[:jwt]
      Unirest.default_header("Authorization", "Bearer #{session[:jwt]}")
    else
      Unirest.clear_default_headers()
    end
  end

end
