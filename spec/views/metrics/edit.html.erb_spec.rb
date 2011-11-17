require 'spec_helper'

describe "metrics/edit.html.erb" do
  before(:each) do
    @metric = assign(:metric, stub_model(Metric,
      :menu => nil,
      :quantity => 1,
      :metric => "MyString"
    ))
  end

  it "renders the edit metric form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => metrics_path(@metric), :method => "post" do
      assert_select "input#metric_menu", :name => "metric[menu]"
      assert_select "input#metric_quantity", :name => "metric[quantity]"
      assert_select "input#metric_metric", :name => "metric[metric]"
    end
  end
end
