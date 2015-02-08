class SessionsController < ApplicationController
  def new
  end
  
  def create
    if login(params[:email], params[:password])
      redirect_to root_path, notice: t("session.logged_in_succesfully")
    else
      flash.now[:alert] = t("session.wrong_login_or_password")
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_path, notice: t("session.logged_out_succesfully")
  end
end
