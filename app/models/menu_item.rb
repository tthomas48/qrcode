class MenuItem < ActiveRecord::Base
  validates :label, :presence => true
  belongs_to :menu, :foreign_key => "menu_id"
end
