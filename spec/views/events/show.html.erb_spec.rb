require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/events/show.html.erb" do
  include EventsHelper
  before(:each) do
    assigns[:events] = @events = stub_model(Events,
      :type => "value for type",
      :name => "value for name",
      :plan_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ type/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
  end
end
