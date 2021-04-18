class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy supply writeoff add_amount cut_amount ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  def add_amount
    @product.add_amount (params[:product][:amount_diff]).to_i
    redirect_to @product, notice: "Products were added."
  end

  def cut_amount
    if @product.cut_amount (params[:product][:amount_diff]).to_i
      redirect_to @product, notice: "Products were cut."
    else
      render :writeoff
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :amount, :code, :category, :price)
    end
end
