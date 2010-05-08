class Source < ActiveRecord::Base

  has_many :deps

  validates_presence_of :url
  validates_uniqueness_of :url

end
