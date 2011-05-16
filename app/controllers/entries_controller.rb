class EntriesController < ApplicationController
  load_and_authorize_resource :pool
  load_and_authorize_resource :entry, :through => :pool
  
  def index
    @entries = @pool.entries
  end
  
  def new
    @entry.build_ghoul
    @ghouls = []
    unless params[:search].blank?
      @ghouls = Ghoul.search(params[:search][:name])
    end
  end
  
  def create
    @entry.owner = current_user
    existing_ghoul = Ghoul.where(:freebase_id => @entry.ghoul.freebase_id).first
    if existing_ghoul.blank?
      @entry.ghoul.sync
    else
      @entry.ghoul = existing_ghoul
    end
    if @entry.save
      redirect_to pool_entries_path(@pool)
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @entry.destroy
    redirect_to @pool
  end
end
