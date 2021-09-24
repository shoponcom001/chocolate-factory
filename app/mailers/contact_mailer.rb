class ContactMailer < ApplicationMailer

  def send_mail(user, order)
    @user = user
    @order = order
    mail to: user.email, subject: '【ChocolateFactory】 ご購入ありがとうございます'
  end

  def production_mail(order)
    @order = order
    mail to: @order.user.email, subject: '【ChocolateFactory】 注文商品の製作を始めます'
  end
  
  def completed_mail(order)
    @order = order
    mail to: @order.user.email, subject: '【ChocolateFactory】 発送'
  end
  
end
