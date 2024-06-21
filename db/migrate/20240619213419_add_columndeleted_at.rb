# frozen_string_literal: true

class AddColumndeletedAt < ActiveRecord::Migration[7.0]
  def change
    add_column :merchandises, :deleted_at, :datetime
    add_index :merchandises, :deleted_at
  end
end
