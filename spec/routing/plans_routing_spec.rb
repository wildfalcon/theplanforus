require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlansController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "plans", :action => "index").should == "/plans"
    end

    it "maps #new" do
      route_for(:controller => "plans", :action => "new").should == "/plans/new"
    end

    it "maps #show" do
      route_for(:controller => "plans", :action => "show", :id => "1").should == "/plans/1"
    end

    it "maps #edit" do
      route_for(:controller => "plans", :action => "edit", :id => "1").should == "/plans/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "plans", :action => "create").should == {:path => "/plans", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "plans", :action => "update", :id => "1").should == {:path =>"/plans/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "plans", :action => "destroy", :id => "1").should == {:path =>"/plans/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/plans").should == {:controller => "plans", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/plans/new").should == {:controller => "plans", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/plans").should == {:controller => "plans", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/plans/1").should == {:controller => "plans", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/plans/1/edit").should == {:controller => "plans", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/plans/1").should == {:controller => "plans", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/plans/1").should == {:controller => "plans", :action => "destroy", :id => "1"}
    end
  end
end
