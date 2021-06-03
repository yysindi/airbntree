class TreehousesController < ApplicationController
  before_action :set_treehouse, only: [:edit, :show, :update, :destroy]

  def new
    @treehouse = Treehouse.new
  end

  def index
    if params[:query].present?
      @treehouses = Treehouse.search_by_location_and_description(params[:query])
    else
      @treehouses = Treehouse.all
    end
  end

  def create
    @treehouse = Treehouse.new(tree_params)
    @treehouse.user = current_user
    if @treehouse.save
      redirect_to treehouse_path(@treehouse.id)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @treehouse.destroy
    redirect_to treehouses_path
  end

  def show
    @markers =
      [{
        lat: @treehouse.latitude,
        lng: @treehouse.longitude
      }]
  end

  def update
    @treehouse.update(tree_params)
    redirect_to treehouse_path(@treehouse)
  end

  private

  def tree_params
    params.require(:treehouse).permit(:name, :price, :description, :img, :location, :photo)
  end

  def set_treehouse
    @treehouse = Treehouse.find(params[:id])
  end
end
