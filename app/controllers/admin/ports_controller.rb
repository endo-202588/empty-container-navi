class Admin::PortsController < Admin::BaseController
  before_action :set_port, only: %i[show edit update destroy]

  def index
    @ports = Port.order(:id)
  end

  def show
    @container_stocks = @port.container_stocks.includes(:carrier)
  end

  def new
    @port = Port.new(
      map_x: 50,
      map_y: 50
    )
  end

  def create
    @port = Port.new(port_params)

    if @port.save
      redirect_to admin_ports_path, success: "港を登録しました"
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @port = Port.find(params[:id])
  end

  def update
    @port = Port.find(params[:id])

    if @port.update(port_params)
      redirect_to admin_ports_path, success: "港情報を更新しました"
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @port.destroy
    redirect_to admin_ports_path, success: "削除しました"
  end

  private

  def set_port
    @port = Port.find(params[:id])
  end

  def port_params
    params.require(:port).permit(:name, :map_x, :map_y)
  end
end
