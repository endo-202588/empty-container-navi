class Admin::ContainerStocksController < Admin::BaseController
  # before_action :set_container_stock, only: %i[show edit update destroy]

  def index
    @container_stocks =
      ContainerStock.includes(:port, :carrier)
  end

  def new
    @container_stock = ContainerStock.new
  end

  def create
    @container_stock = ContainerStock.new(container_stock_params)

    if @container_stock.save
      redirect_to admin_container_stocks_path,
                  success: "在庫を登録しました"
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def set_container_stock
    @container_stock = ContainerStock.find(params[:id])
  end

  def container_stock_params
    params.require(:container_stock).permit(
      :port_id,
      :carrier_id,
      :container_type,
      :quantity
    )
  end
end
