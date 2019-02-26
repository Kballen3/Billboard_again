class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :edit, :update]

  def index
    @billboards = Billboard.all
  end

  def show
  end

  def new
    @billboard = Billboard.new
  end
  
  def create
    @billboard = current_user.billboards.new(billboard_params)
    if @billboard.save
      redirect_to billboards_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to billboard_path
    else
      render :edit
    end
  end

  def destroy
    @billboard.destroy
  end

  private

    def billboard_params
    params.require(:billboard).permit(:name)
    end

    def set_billboard
    current_user.billboards.find(params[:id])
    end

end
