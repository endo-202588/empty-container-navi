class Admin::VoyagesController < Admin::BaseController
  before_action :set_voyage, only: %i[
    edit
    update
    destroy
  ]

  def index
    @voyages =
      Voyage.includes(
        route: [
          :departure_port,
          :arrival_port
        ]
      )
  end

  def new
    @voyage = Voyage.new
  end

  def create
    @voyage = Voyage.new(voyage_params)

    if @voyage.save
      redirect_to admin_voyages_path,
                  success: "便を登録しました"
    else
      render :new,
             status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @voyage.update(voyage_params)
      redirect_to admin_voyages_path,
                  success: "便を更新しました"
    else
      render :edit,
             status: :unprocessable_content
    end
  end

  def destroy
    @voyage.destroy

    redirect_to admin_voyages_path,
                success: "便を削除しました"
  end

  private

  def set_voyage
    @voyage = Voyage.find(params[:id])
  end

  def voyage_params
    params.require(:voyage)
          .permit(
            :departure_date,
            :dry_capacity,
            :reefer_capacity,
            :route_id
          )
  end
end
