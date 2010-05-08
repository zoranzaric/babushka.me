class Run < ActiveRecord::Base

  belongs_to :dep

  validates_inclusion_of :dep, :result, :in => %w[ok fail error]

  scope :succeeded, where(:result => 'ok')
  scope :failed, where(:result => 'failed')
  scope :crashed, where(:result => 'error')
  scope :this_week, where(["created_at >= ? AND created_at < ?", Time.now - 1.week, Time.now])

  attr_accessor :dep_name, :source_url

  validate_on_create :valid_dep?
  validate_on_create :valid_source?

  def valid_dep?
    (dep = Dep.find_or_create_by_name(dep_name)).valid?
  end
  def valid_source?
    (dep.source = Source.find_or_create_by_url(source_url)).valid?
  end
end
