class Admin::ContainerStocksController < Admin::BaseController
  before_action :set_container_stock, only: %i[edit update destroy]

  def index
    @container_stocks =
      ContainerStock.includes(:port, :carrier)
      .joins(:port)
      .order("ports.name ASC", "container_stocks.created_at DESC")
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

  def edit
  end

  def update
    if @container_stock.update(container_stock_params)
      redirect_to admin_container_stocks_path,
                  success: "在庫を更新しました"
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @container_stock.destroy
    redirect_to admin_container_stocks_path, success: "削除しました"
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
