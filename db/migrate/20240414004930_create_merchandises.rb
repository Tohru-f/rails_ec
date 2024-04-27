# frozen_string_literal: true

class CreateMerchandises < ActiveRecord::Migration[7.0]
  def change
    create_table :merchandises do |t|
      t.string :name, null: false
      t.integer :amount, null: false
      t.text :description
      t.integer :stock
      t.string :type

      t.timestamps
    end
  end
end
