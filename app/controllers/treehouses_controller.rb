class TreehousesController < ApplicationController
  before_ action :find_id, only: [:edit, :show, :update, :destroy]

  def new
    @treehouse = Treehouse.new
  end

  def index
    @treehouses = Treehouse.all
  end

  def create
    @treehouse = Treehouse.new(treehouse_params)
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
    @treehouse.update[treehouse_params]
    redirect_to treehouse_path(@treehouse)
  end

  private

  def treehouse_params
    params.require[:treehouse].permit(:name, :price, :description, :img, :location)
  end

  def find_id
    @treehouse = Treehouse.find(params[:id])
  end
end
