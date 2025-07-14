class CustomerOrdersController < ApplicationController
  def index
    orders = CustomerOrder.includes(:customer, :organization).order(created_at: :desc)
    paginated = orders.page(params[:page]).per(20)
    render json: paginated, each_serializer: CustomerOrderSerializer
  end

  def show
    order = CustomerOrder.find(params[:id])
    render json: order, serializer: CustomerOrderSerializer
  end

  def create
    order = CustomerOrder.new(order_params)
    if order.save
      render json: order, status: :created
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    order = CustomerOrder.find(params[:id])
    order.destroy
    head :no_content
  end

  private

  def order_params
    params.require(:customer_order).permit(
      :status, :estimated_delivery_date, :payment_method, :organization_id, :customer_id, :note,
      order_lines_attributes: [:product_id, :quantity, :unit_price_cents, :unit_price_currency],
      order_value_adjustments_attributes: [:description, :value_cents, :value_currency]
    )
  end
end
