class Admins::GoodsController < ApplicationController
  def index
    @goods = Good.all
  end

  def new
  end

  def create
  end

  def show
    @good = Good.find(params[:id])
  end

  def edit
  end

  def update
  end
end
