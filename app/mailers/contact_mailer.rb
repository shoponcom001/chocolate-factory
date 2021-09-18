class ContactMailer < ApplicationMailer

  def send_mail(user, order, design, item)
    @user = user
    @order = order
    @design = design
    @item = item
    mail to: user.email, subject: '【Chocolate_Factory】 ご購入ありがとうございます'
  end

end
