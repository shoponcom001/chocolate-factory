class Public::InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render :confirm
    else
      flash[:alert] = "必要項目を選択してください"
      render :action => 'index'
    end
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver
    render :thanks
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end

end
