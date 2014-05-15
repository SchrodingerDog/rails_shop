class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :delete, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :delete, :update, :destroy]
  # before_action :get_parents, only: [:show, :edit, :delete, :update, :destroy]
  before_action :get_parents, only: [:show]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # GET /categories/1/delete
  def delete
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    def set_product
      @products = @category.products
    end

    def get_parents
      @parents = []
      cur = @category
      while cur.parent_id != 0
        cur = Category.find(cur.parent_id)
        @parents << cur
      end
      @parents.reverse!
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      # params.require(:category).permit(:name, :parent_id)
      params.permit(:name, :parent_id)
    end
end
