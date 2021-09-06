class Admin::DesignsController < ApplicationController
  def index
    @designs = Design.all
  end

  def new
    @design = Design.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
end
