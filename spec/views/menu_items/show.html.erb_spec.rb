require 'spec_helper'

describe "menu_items/show.html.erb" do
  before(:each) do
    @menu_item = assign(:menu_item, stub_model(MenuItem))
  end

  it "renders attributes in <p>" do
    render
  end
end
