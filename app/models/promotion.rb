# frozen_string_literal: true

class Promotion < ApplicationRecord
  validates :code, presence: true, length: { is: 7 }, uniqueness: true
  validates :amount, presence: true, numericality: { only_integer: true, less_than_or_equal_to: -100 }
  belongs_to :cart
end
