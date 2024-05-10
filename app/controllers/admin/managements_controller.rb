# frozen_string_literal: true

module Admin
  class ManagementsController < ApplicationController
    before_action :basic
    before_action :set_merchandise, only: %i[edit update destroy]

    def index
      @merchandises = Merchandise.with_attached_image
    end

    def new
      @merchandise = Merchandise.new
    end

    def create
      @merchandise = Merchandise.new(merchandise_params)
      if @merchandise.save
        redirect_to admin_managements_path, notice: '商品を登録しました。'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @merchandise.update(merchandise_params)
        redirect_to admin_managements_path, notice: '商品の内容を変更しました。'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @merchandise.destroy!
      redirect_to admin_managements_path, notice: '商品を削除しました。'
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

    def set_merchandise
      @merchandise = Merchandise.find(params[:id])
    end
  end
end
