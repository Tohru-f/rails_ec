# frozen_string_literal: true

class AddNameColumn1ToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :name, :string, unique: true
  end
end
