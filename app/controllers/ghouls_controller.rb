class GhoulsController < ApplicationController
  load_and_authorize_resource
  
  def show
    respond_with(@ghoul)
  end
end