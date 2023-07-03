class Admin::ItemsController < ApplicationController
  berore_action :authenticate_admin!, only: [:create, :edit, :update, :index, :show, :new]
end
