class Public::DesignsController < ApplicationController
  def index
    @designs = Design.where(is_ordered: false)
  end
end
