require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/plans/index.html.erb" do
  include PlansHelper

  before(:each) do
    assigns[:plans] = [
      stub_model(Plan,
        :name => "value for name",
        :ical_feed => "value for ical_feed"
      ),
      stub_model(Plan,
        :name => "value for name",
        :ical_feed => "value for ical_feed"
      )
    ]
  end

  it "renders a list of plans" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for ical_feed".to_s, 2)
  end
end
