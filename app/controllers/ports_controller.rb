class PortsController < ApplicationController
  def index
    @ports = Port.all
  end

  def show
    @port = Port.find(params[:id])
    @container_stocks = @port.container_stocks.includes(:carrier)
  end
end
