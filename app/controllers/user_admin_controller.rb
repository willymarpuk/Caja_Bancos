class UserAdminController < ApplicationController
  def index
  	@users = User.all
  end
end
