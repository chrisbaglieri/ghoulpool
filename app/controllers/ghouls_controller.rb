class GhoulsController < ApplicationController
  load_and_authorize_resource
  
  def show
  end
  
  def new
  end
  
  def create
    if @ghoul.sync and @ghoul.save
      redirect_to @ghoul
    else
      render :action => 'new'
    end
  end
end