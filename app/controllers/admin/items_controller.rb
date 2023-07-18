class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :edit, :update, :index, :show, :new]
  
  def index
  @items = Item.all.page(params[:page])
  end
end
