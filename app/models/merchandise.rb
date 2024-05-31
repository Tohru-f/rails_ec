# frozen_string_literal: true

class Merchandise < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  has_many :cart_items, dependent: :destroy
end
