class PoolsController < ApplicationController
  load_and_authorize_resource
  
  def show
    respond_with(@pool)
  end
  
  def new
    @pool.build_rule
    respond_with(@pool)
  end
  
  def create
    @pool.owner = current_user
    @pool.save
    respond_with(@pool)
  end
  
  def edit
    respond_with(@pool)
  end
  
  def update
    @pool.update_attributes(params[:pool])
    respond_with(@pool)
  end
  
  def destroy
    @pool.destroy
    respond_with(@pool)
  end
end
