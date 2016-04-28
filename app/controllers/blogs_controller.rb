class BlogsController < ApplicationController
  layout 'blog'
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :check_user_before_action, only:[:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @current_user_blogs = Blog.where(user: @current_user)
    @global_blogs = Blog.where(global: true)
    @blogs = (@current_user_blogs + @global_blogs).uniq
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @rating = get_rating

    # Attributes required for creating new comments for a blog post
    @comment = Comment.new
    @categories = Category.all
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @categories = Category.all
  end

  # GET /blogs/1/edit
  def edit
    @categories = Category.all
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id



    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        @categories = Category.all
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    @blog.user_id = current_user.id
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @blogs = []
    Blog.where("title LIKE ?" , "%#{params[:term]}%").each {|elem| @blogs << elem.title }
    render json: @blogs
  end

  
  private
    # If current use does not own blog then please redirect to home page
    # with appropriate message.
    def check_user_before_action
      @blog = Blog.find(params[:id])
      if (current_user != @blog.user) and (@blog.global == false)
        redirect_to({ action: "index" }, notice: "You don't have sufficient permissions")

      end
    end



    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def get_rating
      blog = set_blog
      Rating.find_or_create_by({:user_id => current_user.id,
                               :blog_id => blog.id})

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :summary, :body, :date_of_creation, :category_id, :global, :blog_image)
    end
end
