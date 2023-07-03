class Public::CartItemsController < ApplicationController
  before_action :authenticate_public!
end
