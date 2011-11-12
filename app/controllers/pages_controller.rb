class PagesController < ApplicationController

  before_filter :authenticate_user!, :mailer_set_url_options


  def home
  end

  def adhoc
  end

  def report
  end

  def metric
  end

end
