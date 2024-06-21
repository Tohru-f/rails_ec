# frozen_string_literal: true

class AddDeletedAtToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :deleted_at, :datetime
    add_index :order_details, :deleted_at
  end
end
