require 'spec_helper'

describe "metrics/new.html.erb" do
  before(:each) do
    assign(:metric, stub_model(Metric,
      :menu => nil,
      :quantity => 1,
      :metric => "MyString"
    ).as_new_record)
  end

  it "renders new metric form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => metrics_path, :method => "post" do
      assert_select "input#metric_menu", :name => "metric[menu]"
      assert_select "input#metric_quantity", :name => "metric[quantity]"
      assert_select "input#metric_metric", :name => "metric[metric]"
    end
  end
end
