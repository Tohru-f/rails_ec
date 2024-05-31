# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart_item, only: %i[create destroy]

  def create
    # index.html.erbからlink_toメソッドでmerchandise.idをparamsメソッドを通して受け取り、そのidを使って商品を特定する。
    # show.html.erbからform_withのurlを通して@merchandiseを渡すことでparamsメソッドを通して受け取り、そのidを使って商品を特定する。
    @merchandise = Merchandise.find_by(id: params[:format])
    # binding.pry
    check_quantity

    # 数量が0以下、若しくは空白であれば処理を中断
    return if params[:quantity].to_i <= 0 || params[:quantity].blank?

    if @cart_item.save
      flash[:notice] = '商品が追加されました。'
      redirect_to merchandises_path and return
    else
      @merchandises_limit = Merchandise.with_attached_image.order(id: 'DESC').limit(4)
      redirect_to merchandise_path, alert: '商品の追加に失敗しました。' and return
    end
  end

  def destroy
    # index.html.erbからlink_toメソッドでmerchandise.idをparamsメソッドを通して受け取り、そのidを使って商品を特定する。
    @merchandise = Merchandise.find_by(id: params[:format])
    # 商品をカートに入れるにあたり、同じ商品が既にカート内にあれば@変数を流用、無ければ商品idを使って新しく生成
    @cart_item ||= current_cart.cart_items.find_by(merchandise_id: @merchandise.id)
    if @cart_item.destroy
      flash[:notice] = 'カート内の商品が削除されました。'
    else
      flash[:alert] = '商品の削除に失敗しました。'
    end
    redirect_to my_cart_path
  end

  private

  def set_cart_item
    # 現セッションに属するカートの中に選択した商品idの商品が入っていれば@変数に代入
    @cart_item = current_cart.cart_items.find_by(merchandise_id: params[:format])
  end

  def check_quantity
    if params[:quantity].to_i <= 0 || params[:quantity].blank?
      @merchandises_limit = Merchandise.with_attached_image.order(id: 'DESC').limit(4)
      flash[:alert] = '数量は1以上の整数を入力して下さい。'
      # render template: "merchandises/show" and return
      # redirect_toであれば画面がリセットされ、renderのように値を引きついだり表示されない
      # URLにインスタンス変数を渡せばそこから:idを取得してくれる
      redirect_to merchandise_path(@merchandise) and return
    elsif @cart_item.nil?
      # 商品をカートに入れるにあたり商品idを使って新しく生成
      @cart_item = current_cart.cart_items.build(merchandise_id: @merchandise.id)
      # 数量を足す
      @cart_item.quantity += params[:quantity].to_i
      # カートに入れた商品が既にカート内に存在すれば数量を加算、無ければ新しくデータを生成
      # 同じ商品がカート内にない場合、Nilエラーになるので&.で回避
    elsif @cart_item.merchandise_id == @merchandise.id
      # 同じ商品であれば数量を足す
      @cart_item.quantity += params[:quantity].to_i
    end
  end
end
