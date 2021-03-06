class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :delete, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # GET /products/1/delete
  def delete
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    uploaded_io = params[:picture]
    if uploaded_io
      File.open(Rails.root.join('public', 'data', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @product[:picture] = "#{Rails.root}/public/data/#{uploaded_io.original_filename}"
    end
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    uploaded_io = params[:picture]
    params = product_params
    if uploaded_io
      File.open(Rails.root.join('public', 'data', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      params[:picture] = "#{Rails.root}/public/data/#{uploaded_io.original_filename}"
    end
    respond_to do |format|
      if @product.update(params)
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      # params.require(:product).permit(:name, :price, :cat_number, :description)
      params.permit(:name, :price, :catalog_number, :picture, :category_id, :description)
    end
end
