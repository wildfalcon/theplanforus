require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/plans/edit.html.erb" do
  include PlansHelper

  before(:each) do
    assigns[:plan] = @plan = stub_model(Plan,
      :new_record? => false,
      :name => "value for name",
      :ical_feed => "value for ical_feed"
    )
  end

  it "renders the edit plan form" do
    render

    response.should have_tag("form[action=#{plan_path(@plan)}][method=post]") do
      with_tag('input#plan_name[name=?]', "plan[name]")
      with_tag('input#plan_ical_feed[name=?]', "plan[ical_feed]")
    end
  end
end
