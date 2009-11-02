require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/plans/show.html.erb" do
  include PlansHelper
  before(:each) do
    assigns[:plan] = @plan = stub_model(Plan,
      :name => "value for name",
      :ical_feed => "value for ical_feed"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ ical_feed/)
  end
end
