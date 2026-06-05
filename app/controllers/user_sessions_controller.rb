class UserSessionsController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    if login(
        login_params[:email],
        login_params[:password],
      )
      redirect_to ports_path, success: "ログインしました"
    else
      @user = User.new(login_params)
      flash.now[:danger] = "メールまたはパスワードが違います"
      render :new, status: :unprocessable_content
    end
  end


  def destroy
    logout
    redirect_to root_path, success: "ログアウトしました"
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
