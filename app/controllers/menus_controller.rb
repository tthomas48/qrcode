class MenusController < ApplicationController
  # TODO: don't auth user on menu show
  before_filter :authenticate_user!, :mailer_set_url_options
  layout Proc.new { |controller| action_name == 'show' ? 'mobile' : 'application' }

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menu = Menu.find(params[:id])
    @title = @menu.label

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu }
    end
  end

  # GET /menus/new
  # GET /menus/new.json
  def new
    @menu = Menu.new
    @menu.menu_items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu }
    end
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])

  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(params[:menu])

    respond_to do |format|
      if @menu.save
        @menu.bitly_url = shorten(menu_url(:id=>@menu.id))
        @menu.save

        format.html { redirect_to edit_menu_path(@menu), notice: 'Menu was successfully created.' }
        format.json { render json: @menu, status: :created, location: @menu }
      else
        format.html { render action: "new" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.json
  def update

    @menu = Menu.find(params[:id])

    respond_to do |format|
      @menu.bitly_url = shorten(menu_url(@menu))
      if @menu.update_attributes(params[:menu])
        format.html { redirect_to menus_url, notice: 'Menu was successfully updated.' }
        format.json { head :ok }
      elsif params[:menu][:metric_dates_attributes].length > 0
        format.html { render action: "edit_metric" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :ok }
    end
  end

  
  def edit_metric
    @menu = Menu.find(params[:id])

    types = []
    Qrcode::Application.config.metric_types.each do |metric_type|
      types.push(metric_type)
    end
    @metric_types = ActiveSupport::JSON.encode types
    @metric_types = "var metric_types = " + @metric_types
    
    if @menu.metric_dates.length == 0
      @menu.metric_dates.build
      logger.info @menu.metric_dates
      md = @menu.metric_dates[0]


      md.metrics = []
      Qrcode::Application.config.metric_types.each do |metric_type| 
        metric = Metric.new
        metric.metric = metric_type
        metric.metric_date_id = md.id
        md.metrics.push(metric)
      end
    end
  end
 
  def report
    @menu = Menu.find(params[:id])

    @totals = {}
    @donors_by_date_dates = []
    @donors_by_date = []
    @menu.metric_dates.each do |metric_date|

      @donors_by_date_dates.push(metric_date.showdate.strftime('%b %-d'))

      donation_quantity = 0
      total_quantity = 0

      metric_date.metrics.each do |metric|
        if @totals[metric.metric].nil?
          @totals[metric.metric] = 0
        end
        @totals[metric.metric] += metric.quantity

        if metric.metric == 'Donations'
          donation_quantity = metric.quantity
        elsif metric.metric == 'Total Audience'
          total_quantity = metric.quantity
        end
      end
      @donors_by_date.push([donation_quantity, total_quantity - donation_quantity])
    end   
   


    total_clicks = clicks(@menu.bitly_url)
    @total_clickers_data = [total_clicks, @totals['Total Audience']]
    @total_donors_data = [@totals['Donations'], @totals['Total Audience'] - @totals['Donations']]
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

  def clicks(url)

    Bitly.use_api_version_3
    b = Bitly.new(Qrcode::Application.config.bitly_username, Qrcode::Application.config.bitly_api_key)
    output = b.clicks(url)
    return output.user_clicks
  end
end
