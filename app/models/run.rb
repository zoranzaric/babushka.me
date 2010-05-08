class Run < ActiveRecord::Base

  belongs_to :dep

  validates_presence_of :dep
  validates_inclusion_of :result, :in => %w[ok fail error]

  scope :succeeded, where(:result => 'ok')
  scope :failed, where(:result => 'failed')
  scope :crashed, where(:result => 'error')
  scope :this_week, where(["created_at >= ? AND created_at < ?", Time.now - 1.week, Time.now])

  attr_accessor :dep_name, :source_url
  before_validation :load_dep_and_source

  def load_dep_and_source
    existing_source = Source.find_or_create_by_url(source_url)
    self.dep = existing_source.deps.find_or_create_by_name(dep_name)
  end
end
