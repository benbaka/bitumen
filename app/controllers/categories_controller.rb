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
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html {redirect_to categories_url, notice: 'Blog was successfull deleted'}
    end

  end

  def update
    respond_to do |format|
      @category = Category.find(params[:id])
      if @category.update(category_params)
        format.html {redirect_to @category, notice: 'Category was successfully updated.'}
      else
        format.html {render :edit }
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def show
    set_category
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
