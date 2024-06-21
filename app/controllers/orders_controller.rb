# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order[:total_amount] = params[:format]
    if @order.save
      @cart_items.each do |item|
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.merchandise_id = item.merchandise_id
        order_detail.name = item.merchandise.name
        order_detail.quantity = item.quantity
        order_detail.amount = item.quantity * item.merchandise.amount
        order_detail.save
      end
      redirect_to merchandises_path, notice: 'ご購入ありがとうございます。'
      OrderMailer.purchasing_email(@order).deliver_now
      @cart_items.destroy_all
    else
      render template: 'carts/my_cart', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :username, :email, :address, :address2, :country,
                                  :prefecture, :zip, :name_on_card, :credit_card_number, :expiration, :cvv)
  end
end
