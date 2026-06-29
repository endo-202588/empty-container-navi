class EmailsController < ApplicationController
  def edit
  end

  def update
    if current_user.update(email_params)
      redirect_to profile_path, success: "メールアドレスを変更しました"
    else
      flash.now[:danger] = "変更に失敗しました"
      render :edit, status: :unprocessable_content
    end
  end

  private

  def email_params
    params.require(:user).permit(:email)
  end
end
