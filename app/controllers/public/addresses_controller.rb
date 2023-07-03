class Public::AddressesController < ApplicationController
  befor_action :authenticate_public!
end
