class Public::OrdersController < ApplicationController
  before_action :authenticate_public!
end
