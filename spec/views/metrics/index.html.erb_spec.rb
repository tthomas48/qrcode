require 'spec_helper'

describe "metrics/index.html.erb" do
  before(:each) do
    assign(:metrics, [
      stub_model(Metric,
        :menu => nil,
        :quantity => 1,
        :metric => "Metric"
      ),
      stub_model(Metric,
        :menu => nil,
        :quantity => 1,
        :metric => "Metric"
      )
    ])
  end

  it "renders a list of metrics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Metric".to_s, :count => 2
  end
end
