class Dep < ActiveRecord::Base

  belongs_to :source

  has_many :runs

  validates_presence_of :source, :name
  validates_uniqueness_of :name, :scope => :source_id

  scope :search, lambda {|term| where(["name LIKE ?", "%#{term}%"]) }

  def runs_this_week
    runs.this_week.count
  end

  def success_rate_this_week
    1.0 * runs.this_week.where(:result => 'ok').count / runs.this_week.count
  end

end
