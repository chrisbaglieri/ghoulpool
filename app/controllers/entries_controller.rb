class EntriesController < ApplicationController
  load_and_authorize_resource :pool
  load_and_authorize_resource :entry, :through => :pool
  
  def index
    @entries = @pool.entries.page(params[:page]).per(10)
    respond_with(@entries)
  end
  
  def new
    @entry.build_ghoul
    @ghouls = []
    unless params[:search].blank?
      @ghouls = Ghoul.search(params[:search][:name])
    end
    respond_with(@entry)
  end
  
  def create
    @entry.owner = current_user
    existing_ghoul = Ghoul.where(:freebase_id => @entry.ghoul.freebase_id).first
    if existing_ghoul.blank?
      @entry.ghoul.sync
    else
      @entry.ghoul = existing_ghoul
    end
    unless @entry.save
      @ghouls = []
    end
    respond_with(@entry, :location => pool_entries_url(@pool))
  end
  
  def destroy
    @entry.destroy
    respond_with(@entry, :location => pool_entries_url(@pool))
  end
end
