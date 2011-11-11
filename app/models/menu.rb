class Menu < ActiveRecord::Base
  validates :label, :presence => true
  belongs_to :user, :class_name => User
  has_many :menu_items

  accepts_nested_attributes_for :menu_items, :allow_destroy => true
end
