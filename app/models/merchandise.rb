# frozen_string_literal: true

class Merchandise < ApplicationRecord
  has_one_attached :image
end
