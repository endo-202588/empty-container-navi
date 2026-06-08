class Admin::BaseController < ApplicationController
  before_action :require_login
  before_action :require_admin

  private

  def require_admin
    return if current_user&.admin?

    redirect_to root_path, danger: "権限がありません"
  end
end
