class MenuItem < ActiveRecord::Base
  validates :label, :presence => true
  belongs_to :menu, :foreign_key => "menu_id"
  before_save :shorten_url
  
  def shorten_url()
    self.bitly_url = shorten(self.url)
  end

  def shorten(url)
    Bitly.use_api_version_3
    b = Bitly.new(Qrcode::Application.config.bitly_username, Qrcode::Application.config.bitly_api_key)
    begin
      output = b.shorten(url)
      return output.short_url
    rescue
      return url
    end
  end
end
