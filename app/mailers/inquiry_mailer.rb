class InquiryMailer < ApplicationMailer
  
  def received_email(inquiry)
    @inquiry = inquiry
    mail to: "chocolate.factory.shoes@gmail.com",　subject: '【ChocolateFactory】 お問い合わせがありました'
  end
  
end
