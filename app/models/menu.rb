class Menu < ActiveRecord::Base
  validates :label, :presence => true
  belongs_to :user, :class_name => User
  has_many :menu_items
  has_many :metric_dates, :order => 'showdate'

  accepts_nested_attributes_for :menu_items, :metric_dates, :allow_destroy => true
end
