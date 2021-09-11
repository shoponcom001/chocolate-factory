class Admin::AdminsController < ApplicationController
  before_action :header

  def header
    @period = Period.last
  end

end