class CategoriesController < ApplicationController
  def new
    @category = Category.new

  end

  def create

  end

  def destroy
  end

  def edit
  end

  def index
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name)
  end
end
