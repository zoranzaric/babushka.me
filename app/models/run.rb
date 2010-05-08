class Run < ActiveRecord::Base

  validates_presence_of :dep_name, :source_url
  validates_inclusion_of :result, :in => %w[ok fail error]

  scope :succeeded, where(:result => 'ok')
  scope :failed, where(:result => 'failed')
  scope :crashed, where(:result => 'error')
  scope :for_source, lambda {|url| where(:source_url => url) }

end
