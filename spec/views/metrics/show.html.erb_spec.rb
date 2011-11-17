require 'spec_helper'

describe "metrics/show.html.erb" do
  before(:each) do
    @metric = assign(:metric, stub_model(Metric,
      :menu => nil,
      :quantity => 1,
      :metric => "Metric"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Metric/)
  end
end
