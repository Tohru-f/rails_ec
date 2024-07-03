# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    set_params
    ActiveRecord::Base.transaction do
      @order.save!
      @cart_items.each do |item|
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.merchandise_id = item.merchandise_id
        order_detail.name = item.merchandise.name
        order_detail.quantity = item.quantity
        order_detail.amount = item.quantity * item.merchandise.amount
        order_detail.save!
      end
      redirect_to merchandises_path, notice: 'ご購入ありがとうございます。'
      OrderMailer.purchasing_email(@order).deliver_now
      Promotion.find_by(id: params[:promotion_code]).destroy
      @cart_items.destroy_all
    end
  rescue ActiveRecord::RecordInvalid
    render template: 'carts/my_cart', status: :unprocessable_entity
  end

  def update
    @promotion_code = Promotion.find_by(code: params[:code])

    if @promotion_code
      flash.now[:notice] = 'プロモーションコードを適用しました。'
    else
      flash.now[:alert] = '使用できるプロモーションコードを入力して下さい。'
    end
    render template: 'carts/my_cart'
  end

  private

  def set_params
    @order = Order.new(order_params)
    @order[:total_amount] = params[:format]
    @order[:discount_amount] = Promotion.find_by(id: params[:promotion_code]).amount
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :username, :email, :address, :address2, :country,
                                  :prefecture, :zip, :name_on_card, :credit_card_number, :expiration, :cvv)
  end
end
