class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    @order = order
    @url = 'http//example.com/login'
    mail(subject: "test test",
         template_path: 'user_mailer',
         template_name: 'order_receipt')
  end
end