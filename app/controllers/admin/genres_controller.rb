class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
end
