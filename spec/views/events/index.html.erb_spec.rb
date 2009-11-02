require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/events/index.html.erb" do
  include EventsHelper

  before(:each) do
    assigns[:events] = [
      stub_model(Events,
        :type => "value for type",
        :name => "value for name",
        :plan_id => 1
      ),
      stub_model(Events,
        :type => "value for type",
        :name => "value for name",
        :plan_id => 1
      )
    ]
  end

  it "renders a list of events" do
    render
    response.should have_tag("tr>td", "value for type".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
