# frozen_string_literal: true

namespace :promotion_code do
  desc 'プロモーションコードを生成'
  task generate: :environment do
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    numbers.each do |number|
      if number <= 9
        Promotion.new(
          code: "prm0#{number}00",
          amount: -100 * number
        ).save!(validate: false)
      elsif number == 10
        Promotion.new(
          code: 'prm1000',
          amount: -100 * number
        ).save!(validate: false)
        break
      end
    end
  end
end
