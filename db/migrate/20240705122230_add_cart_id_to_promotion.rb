# frozen_string_literal: true

class AddCartIdToPromotion < ActiveRecord::Migration[7.0]
  def change
    add_reference :promotions, :cart, foreign_key: true
  end
end
