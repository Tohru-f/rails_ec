# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def purchasing_email(order)
    @order = order
    mail(
      subject: 'ご注文完了メール',
      to: @order.email
    )
  end
end
