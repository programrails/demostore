class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  before_action :xhr_history, only: [:update, :destroy]

  before_action :set_cart, only: [:destroy]

  # # GET /line_items
  # # GET /line_items.json
  # def index
  #   @line_items = LineItem.all
  # end

  # # GET /line_items/1
  # # GET /line_items/1.json
  # def show
  # end

  # # GET /line_items/new
  # def new
  #   @line_item = LineItem.new
  # end

  # # GET /line_items/1/edit
  # def edit
  # end

  # # POST /line_items
  # # POST /line_items.json
  # def create
  #   @line_item = LineItem.new(line_item_params)

  #   respond_to do |format|
  #     if @line_item.save
  #       format.html { redirect_to @line_item, notice: 'Line item was successfully created.' }
  #       # format.html { redirect_back(fallback_location: products_path) }
  #       format.json { render :show, status: :created, location: @line_item }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @line_item.errors, status: :unprocessable_entity }
  #       flash.now[:notice] = "The product failed to change." 
  #       format.js {}
  #     end
  #   end
  # end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        # format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        # # format.html { redirect_back(fallback_location: products_path, notice: 'Quantity was successfully updated.') }
        # format.json { render :show, status: :ok, location: @line_item }
        flash.now[:notice] = "The product was changed." 
        format.js {}
      else
        # format.html { render :edit }
        # format.json { render json: @line_item.errors, status: :unprocessable_entity }
        flash.now[:notice] = "The product failed to change." 
        format.js {}
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      # format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      # # format.html { redirect_back(fallback_location: products_path, notice: 'Product item was successfully destroyed.') }
      # format.json { head :no_content }
      flash.now[:notice] = "The product was removed from your cart."
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params      
      params.require(:line_item).permit(:cart_id, :order_id, :product_id, :quantity)
    end

    def set_cart

      @cart = @line_item.cart

    end
end
