# frozen_string_literal: true

class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :code, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
