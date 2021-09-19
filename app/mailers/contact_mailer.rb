class ContactMailer < ApplicationMailer

  def send_mail(user, order)
    @user = user
    @order = order
    mail to: user.email, subject: '【Chocolate_Factory】 ご購入ありがとうございます'
  end

  def production_mail(order)
    @order = order
    mail to: @order.user.email, subject: '【Chocolate_Factory】 注文商品の製作を始めます'
  end
  
  def completed_mail(order)
    @order = order
    mail to: @order.user.email, subject: '【Chocolate_Factory】 発送'
  end
  
end
