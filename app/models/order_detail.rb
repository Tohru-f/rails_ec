# frozen_string_literal: true

class OrderDetail < ApplicationRecord
  belongs_to :merchandise
  belongs_to :order
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  acts_as_paranoid without_default_scope: true
end
