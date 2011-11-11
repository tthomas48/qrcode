require 'spec_helper'

describe "menu_items/edit.html.erb" do
  before(:each) do
    @menu_item = assign(:menu_item, stub_model(MenuItem))
  end

  it "renders the edit menu_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => menu_items_path(@menu_item), :method => "post" do
    end
  end
end
