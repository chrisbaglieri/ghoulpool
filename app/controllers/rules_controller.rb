class RulesController < ApplicationController
  load_and_authorize_resource :pool
  load_and_authorize_resource :rule, :through => :pool, :singleton => true
  
  def new
  end
  
  def create
    if @rule.save
      redirect_to @pool
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @rule.update_attributes(params[:rule])
      redirect_to @pool
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @rule.destroy
    redirect_to @pool
  end
end
