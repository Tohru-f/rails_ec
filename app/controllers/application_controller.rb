# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :my_cart

  helper_method :current_cart

  private

  def current_cart
    # cart_idをsessionに持つカードがあれば代入、無ければ新しく作って代入
    current_cart = Cart.find_by(id: session[:cart_id]) || Cart.create
    # cart_idが入ったsessionがあればそのまま使う。無ければcurrent_cartのidを代入
    session[:cart_id] ||= current_cart.id
    # カート情報を返す
    current_cart
  end

  def my_cart
    # 現セッションに属するcart_itemsから取得したリソースの外部キーの値と一致している主キーの値を持つMerchandiseモデルのリソースを全て取得
    @cart_items = current_cart.cart_items.includes([:merchandise])
    @total_amount = 0
  end
end
