class Admin::LineItemsController < Admin::ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /admin/line_items
  # GET /admin/line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /admin/line_items/1
  # GET /admin/line_items/1.json
  def show
  end

  # GET /admin/line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /admin/line_items/1/edit
  def edit
  end

  # POST /admin/line_items
  # POST /admin/line_items.json
  def create
    @line_item = LineItem.new(line_item_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to [:admin, @line_item], notice: 'Line item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/line_items/1
  # PATCH/PUT /admin/line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to [:admin, @line_item], notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/line_items/1
  # DELETE /admin/line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to admin_line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
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
end
