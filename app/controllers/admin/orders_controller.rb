# frozen_string_literal: true

module Admin
  class OrdersController < ApplicationController
    def index
      @orders = Order.all
    end

    def show
      @order = Order.find(params[:id])
    end
  end
end
