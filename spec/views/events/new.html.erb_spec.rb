require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/events/new.html.erb" do
  include EventsHelper

  before(:each) do
    assigns[:events] = stub_model(Events,
      :new_record? => true,
      :type => "value for type",
      :name => "value for name",
      :plan_id => 1
    )
  end

  it "renders new events form" do
    render

    response.should have_tag("form[action=?][method=post]", events_path) do
      with_tag("input#events_type[name=?]", "events[type]")
      with_tag("input#events_name[name=?]", "events[name]")
      with_tag("input#events_plan_id[name=?]", "events[plan_id]")
    end
  end
end
