require 'spec_helper'

describe "menu_items/new.html.erb" do
  before(:each) do
    assign(:menu_item, stub_model(MenuItem).as_new_record)
  end

  it "renders new menu_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => menu_items_path, :method => "post" do
    end
  end
end
