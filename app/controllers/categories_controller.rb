class CategoriesController < ApplicationController
  def new
    @category = Category.new

  end

  def create
    @category = Category.create(category_params)

    respond_to do |format|
      if @category.save
        format.html {redirect_to @category, notice: "Category was successfully created"}
        format.json {render :show, status: :created, location: @category}
      else
        format.html {render :new}
        format.json {render json: @category.errors, status: :unprocessable_entity}
      end
    end
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
