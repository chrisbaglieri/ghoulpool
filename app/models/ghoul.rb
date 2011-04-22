class Ghoul < ActiveRecord::Base
  attr_accessible :name, :born_on
  validates_presence_of :name, :born_on
  validates_uniqueness_of :name
  validates_uniqueness_of :freebase_id
  has_many :entries
  
  def alive?
    return @alive if defined?(@alive)
    @alive = true
    if self.died_on.blank?
      query = { "type" => "/people/deceased_person", "id" => "#{self.freebase_id}", "date_of_death" => [] }
      matches = Ken.session.mqlread([query])
      @alive = matches.blank?
    end
    @alive
  end
end
