# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :merchandises, through: :order_details
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :country, presence: true
  validates :prefecture, presence: true
  VALID_POSTAL_CODE_REGEX = /\d{3}-?\d{4}/
  validates :zip, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :name_on_card, presence: true
  validates :credit_card_number, presence: true, length: { in: 14..16 }
  validates :expiration, presence: true
  validates :cvv, presence: true, length: { in: 3..4 }
  validates :total_amount, presence: true
end
