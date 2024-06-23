# frozen_string_literal: true

module Admin
  class OrdersController < ApplicationController
    before_action :basic

    def index
      @orders = Order.all
    end

    def show
      @order = Order.find(params[:id])
    end

    private

    def basic
      authenticate_or_request_with_http_basic do |_username, password|
        ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
