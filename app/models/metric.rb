class Metric < ActiveRecord::Base
  belongs_to :metric_date, :foreign_key => "metric_date_id"
  validates :quantity, :presence => true
  validates :metric, :presence => true
  #validates :metric_date_id, :presence => true
end
