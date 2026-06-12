class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: %i[
    edit
    update
    destroy
  ]

  def index
    @routes =
      Route.includes(
        :departure_port,
        :arrival_port
      )
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to admin_routes_path,
                  success: "航路を登録しました"
    else
      render :new,
             status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @route.update(route_params)
      redirect_to admin_routes_path,
                  success: "航路を更新しました"
    else
      render :edit,
             status: :unprocessable_content
    end
  end

  def destroy
    @route.destroy

    redirect_to admin_routes_path,
                success: "航路を削除しました"
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route)
          .permit(
            :departure_port_id,
            :arrival_port_id
          )
  end
end
