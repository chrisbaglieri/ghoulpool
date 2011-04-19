class PoolsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @pools = current_user.pools
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @pool.save
      redirect_to @pool
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @pool.update_attributes(params[:pool])
      redirect_to @pool
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @pool.destroy
    redirect_to pools_url
  end
end
