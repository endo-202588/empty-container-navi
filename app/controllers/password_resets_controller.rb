class PasswordResetsController < ApplicationController
  skip_before_action :require_login
  before_action :load_user_from_token, only: %i[edit update]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user
      @user.deliver_reset_password_instructions!
    end

    redirect_to root_path, success: "メールを送信しました"
  end

  def edit
    @token = params[:token]
  end

  def update
    @user.password_confirmation = password_params[:password_confirmation]

    if @user.change_password(password_params[:password])
      redirect_to login_path, success: "パスワードを変更しました"
    else
      flash.now[:alert] = "パスワードを確認してください"
      render :edit, status: :unprocessable_content
    end
  end

  private

  def load_user_from_token
    @user = User.load_from_reset_password_token(params[:token])

    redirect_to root_path, alert: "無効なリンクです" unless @user
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
