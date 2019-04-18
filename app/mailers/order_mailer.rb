class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @order = order
    mail(to: @order.email, subject: "order# #{@order.id} details from Jungle")
  end
end
