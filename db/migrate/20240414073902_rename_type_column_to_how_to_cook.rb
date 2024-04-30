# frozen_string_literal: true

class RenameTypeColumnToHowToCook < ActiveRecord::Migration[7.0]
  def change
    rename_column :merchandises, :type, :how_to_cook
  end
end
