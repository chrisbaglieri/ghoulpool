class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :ghoul
  belongs_to :pool
end