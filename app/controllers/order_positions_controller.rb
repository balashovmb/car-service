class OrderPositionsController < ApplicationController
  before_action :set_order_position, only: %i[ show edit update destroy ]
  before_action :set_order, only: %i[ new create ]

  # GET /order_positions or /order_positions.json
  def index
    @order_positions = OrderPosition.all
  end

  # GET /order_positions/1 or /order_positions/1.json
  def show

  end

  # GET /order_positions/new
  def new
    @order_position = OrderPosition.new
  end

  # GET /order_positions/1/edit
  def edit
  end

  # POST /order_positions or /order_positions.json
  def create
    @order_position = @order.order_positions.new(order_position_params)

    respond_to do |format|
      if @order_position.save
        format.html { redirect_to edit_order_url(@order), notice: "Order position was successfully created." }
      else
        format.html { render 'orders/edit', status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_positions/1 or /order_positions/1.json
  def update
    respond_to do |format|
      if @order_position.update(order_position_params)
        format.html { redirect_to edit_order_url(@order_position.order), notice: "Order position was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_positions/1 or /order_positions/1.json
  def destroy
    @order_position.destroy

    respond_to do |format|
      format.html { redirect_to edit_order_url(@order_position.order), notice: "Order position was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_position
      @order_position = OrderPosition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_position_params
      params.require(:order_position).permit(:executor_id, :service_unit_id)
    end

    def set_order
      @order = Order.find(params[:order_id])
    end
end
