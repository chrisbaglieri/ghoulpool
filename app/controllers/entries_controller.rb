class EntriesController < ApplicationController
  load_and_authorize_resource :pool
  load_and_authorize_resource :entry, :through => :pool
  
  def index
    @entries = @pool.entries
  end
  
  def new
    @ghouls = []
    unless params[:search].blank?
      @ghouls = Ghoul.search(params[:search][:name])
    end
  end
  
  def create
    @entry.owner = current_user
    @entry.ghoul = Ghoul.new(:freebase_id => params[:freebase_id])
    if @entry.ghoul.sync and @entry.save
      redirect_to @pool
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @entry.destroy
    redirect_to @pool
  end
end
