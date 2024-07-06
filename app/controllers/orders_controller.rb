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
      Promotion.find_by(id: params[:promotion_code])&.destroy
      current_cart.destroy
    end
  rescue ActiveRecord::RecordInvalid
    render template: 'carts/my_cart', status: :unprocessable_entity
  end

  def update
    @promotion_code = Promotion.find_by(code: params[:code])
    if @promotion_code.nil?
      flash.now[:alert] = '使用できるプロモーションコードを入力して下さい。'
      render template: 'carts/my_cart'
      return
    elsif current_cart.promotion
      flash.now[:alert] = '一度のお買い物で使用できるコードは一つだけです。'
      render template: 'carts/my_cart'
      return
    else
      @promotion_code[:cart_id] = current_cart.id
      @promotion_code.save!
      flash.now[:notice] = 'プロモーションコードを適用しました。'
      render template: 'carts/my_cart'
    end
  end

  private

  def set_params
    @order = Order.new(order_params)
    @order[:total_amount] = params[:format]
    return unless Promotion.find_by(id: params[:promotion_code])

    @order[:discount_amount] =
      Promotion.find_by(id: params[:promotion_code]).amount
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :username, :email, :address, :address2, :country,
                                  :prefecture, :zip, :name_on_card, :credit_card_number, :expiration, :cvv)
  end
end
