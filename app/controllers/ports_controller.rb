class PortsController < ApplicationController
  before_action :set_port, only: %i[show edit update destroy]

  def index
    @ports = Port.all
  end

  def show
    @container_stocks = @port.container_stocks.includes(:carrier)
  end

  def new
    @port = Port.new
  end

  def create
    @port = Port.build(port_params)

    if @port.save
      redirect_to ports_path, success: "港を登録しました"
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @port.update(port_params)
      redirect_to @port, success: "編集が完了しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @port.destroy
    redirect_to ports_path, success: "削除しました"
  end

  private

  def set_port
    @port = Port.find(params[:id])
  end

  def port_params
    params.require(:port).permit(:name, :map_x, :map_y)
  end
end
