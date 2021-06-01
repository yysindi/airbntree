class TreehousesController < ApplicationController
  before_action :set_treehouse, only: [:edit, :show, :update, :destroy]

  def new
    @treehouse = Treehouse.new
  end

  def index
    @treehouses = Treehouse.all
  end

  def create
    @treehouse = Treehouse.new(tree_params)
    @treehouse.user = current_user
    if @treehouse.save
      redirect_to treehouses_path
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
