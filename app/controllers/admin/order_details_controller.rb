class Admin::OrderDetailsController < ApplicationController
  berore_action :authenticate_admin
end
