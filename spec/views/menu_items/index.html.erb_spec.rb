require 'spec_helper'

describe "menu_items/index.html.erb" do
  before(:each) do
    assign(:menu_items, [
      stub_model(MenuItem),
      stub_model(MenuItem)
    ])
  end

  it "renders a list of menu_items" do
    render
  end
end
