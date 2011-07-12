module EntriesHelper
  def freebase_url(freebase_id)
    "http://www.freebase.com/view#{freebase_id}"
  end
  
  def freebase_metadata(ghoul)
    metadata = ghoul.name
    if ghoul.born_on.blank?
      metadata += " (birth date unknown)"
    else
      metadata += " (born #{ghoul.born_on.strftime('%m/%d/%Y')})"
    end
    metadata
  end
end
