class Admin::OrdersController < ApplicationController
  berore_action :authenticate_admin!
end
