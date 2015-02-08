class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :admin?
  
  def admin?
    session[:admin]
  end
  
  def login(email, password)
    if email == ENV.fetch("EMAIL") && password == ENV.fetch("PASSWORD")
      session[:admin] = true
    end
  end
  
  def logout
    session[:admin] = false
  end
end
