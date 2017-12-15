class OrdersController < ApplicationController

  before_action :authenticate_user!

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  before_action :check_order, only: [:create]

  before_action :xhr_history, only: [:new, :create]

  # # GET /orders
  # # GET /orders.json
  # def index
  #   @orders = Order.where(user_id: current_user.id).order(:created_at)
  # end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # # GET /orders/1/edit
  # def edit
  # end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    @order.fill_in

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }        
      end
    end
  end

  # # PATCH/PUT /orders/1
  # # PATCH/PUT /orders/1.json
  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)

  #       @order.fill_in

  #       format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @order }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /orders/1
  # # DELETE /orders/1.json
  # def destroy
  #   @order.destroy
  #   respond_to do |format|
  #     format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      par = params.require(:order).permit(:user_id, :pay_type)
      if action_name == "create"
        par[:user_id] = current_user.id
      end
      par
    end

    def check_order

      if !current_user.cart || current_user.cart.line_items.empty?

        respond_to do |format|

          format.html { redirect_back(fallback_location: products_path, notice: 'Your cart is empty.') }

        end

      end

      if current_user.name.blank?

        respond_to do |format|

          format.html { redirect_back(fallback_location: products_path, notice: 'You did not provide your name in your user profile.') }

        end

      end

      if current_user.address.blank?

        respond_to do |format|

          format.html { redirect_back(fallback_location: products_path, notice: 'You did not provide your address in your user profile.') }

        end

      end

    end

end
