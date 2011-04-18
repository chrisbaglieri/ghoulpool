class DashboardController < ApplicationController
  def index
    @pools = current_user.pools
  end

end
