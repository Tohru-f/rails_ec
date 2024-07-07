# frozen_string_literal: true

class AddDiscountAmountToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :discount_amount, :integer
  end
end
