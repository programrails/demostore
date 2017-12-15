class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  before_action :check_clear_cart, only: [:update]

  before_action :check_cart_add_product, only: [:update]

  before_action :xhr_history, only: [:update, :show]

  # GET /carts
  # GET /carts.json
  # def index
  #   @carts = Cart.all
  # end

  # GET /carts/1
  # GET /carts/1.json
  def show
    respond_to do |format|
      format.html {}
      # format.json {}
      # flash.now[:notice] = "The product was added to the cart." 
      format.js {}
    end
  end

  # # GET /carts/new
  # def new
  #   @cart = Cart.new
  # end

  # # GET /carts/1/edit
  # def edit
  # end

  # # POST /carts
  # # POST /carts.json
  # def create
  #   @cart = Cart.new(cart_params)

  #   respond_to do |format|
  #     if @cart.save
  #       format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
  #       format.json { render :show, status: :created, location: @cart }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
        flash.now[:notice] = @flash_notice
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
        flash.now[:notice] = "Error (this did not happen): " + @flash_notice
        format.js {}
      end
    end
  end

  # # DELETE /carts/1
  # # DELETE /carts/1.json
  # def destroy
  #   @cart.destroy
  #   respond_to do |format|
  #     format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :id, :clear_line_items)
    end

    def check_cart_add_product

      if params[:add_product_id]

        @cart.add_product params[:add_product_id], params[:add_product_quantity]

        @flash_notice = "The product was added to the cart."

      end

    end

    def check_clear_cart

      if params[:clear_line_items]

        @cart.line_items.clear

        @flash_notice = "Your cart was successfully emptied."

      end

    end    
end
