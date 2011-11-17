class SplashController < ApplicationController
  layout Proc.new { |controller| action_name == 'show' ? 'mobile' : 'application' }

  def splash
  end

  def show
    @menu = Menu.find(params[:id])
    @title = @menu.label

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu }
    end
  end
end
