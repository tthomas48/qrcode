class MetricDate < ActiveRecord::Base
  belongs_to :menu, :foreign_key => "menu_id"
  has_many :metrics, :dependent => :delete_all
  validates :showdate, :presence => true
  validates :menu_id, :presence => true

  accepts_nested_attributes_for :metrics, :allow_destroy => true
end
