require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/plans/new.html.erb" do
  include PlansHelper

  before(:each) do
    assigns[:plan] = stub_model(Plan,
      :new_record? => true,
      :name => "value for name",
      :ical_feed => "value for ical_feed"
    )
  end

  it "renders new plan form" do
    render

    response.should have_tag("form[action=?][method=post]", plans_path) do
      with_tag("input#plan_name[name=?]", "plan[name]")
      with_tag("input#plan_ical_feed[name=?]", "plan[ical_feed]")
    end
  end
end
