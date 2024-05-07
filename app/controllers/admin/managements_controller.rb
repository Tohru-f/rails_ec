# frozen_string_literal: true

module Admin
  class ManagementsController < ApplicationController
    before_action :basic

    def index
      @merchandises = Merchandise.with_attached_image
    end

    def destroy
      @merchandise = Merchandise.find(params[:id])
      @merchandise.destroy!
      redirect_to admin_managements_path, notice: '商品を削除しました。'
    end

    def new
      @merchandise = Merchandise.new
    end

    def create
      Merchandise.create(merchandise_params)
      redirect_to admin_managements_path, notice: '商品を登録しました。'
    end

    def edit
      @merchandise = Merchandise.find(params[:id])
    end

    def update
      @merchandise = Merchandise.find(params[:id])
      @merchandise.update!(merchandise_params)
      redirect_to admin_managements_path, notice: '商品の内容を変更しました。'
    end

    private

    def merchandise_params
      params.require(:merchandise).permit(:name, :amount, :description, :stock, :how_to_cook, :image)
    end

    def basic
      authenticate_or_request_with_http_basic do |_username, password|
        ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
