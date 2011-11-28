class SplashController < ApplicationController
  layout Proc.new { |controller| action_name == 'show' ? 'mobile' : 'application' }
  after_filter Proc.new { |controller| action_name == 'help' ? :set_content_type : '' }

  def splash
    if user_signed_in?
      redirect_to menus_url
    end
  end

  def show
    @menu = Menu.find(params[:id])
    @title = @menu.label

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu }
    end
  end
  def set_content_type
    logger.info "Setting content type"
    headers["Content-Type"] = "image/svg+xml"
  end 
  def help
    @menu = Menu.find(params[:id])
  end
end
