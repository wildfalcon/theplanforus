require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EventsController do

  def mock_events(stubs={})
    @mock_events ||= mock_model(Events, stubs)
  end

  describe "GET index" do
    it "assigns all events as @events" do
      Events.stub!(:find).with(:all).and_return([mock_events])
      get :index
      assigns[:events].should == [mock_events]
    end
  end

  describe "GET show" do
    it "assigns the requested events as @events" do
      Events.stub!(:find).with("37").and_return(mock_events)
      get :show, :id => "37"
      assigns[:events].should equal(mock_events)
    end
  end

  describe "GET new" do
    it "assigns a new events as @events" do
      Events.stub!(:new).and_return(mock_events)
      get :new
      assigns[:events].should equal(mock_events)
    end
  end

  describe "GET edit" do
    it "assigns the requested events as @events" do
      Events.stub!(:find).with("37").and_return(mock_events)
      get :edit, :id => "37"
      assigns[:events].should equal(mock_events)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created events as @events" do
        Events.stub!(:new).with({'these' => 'params'}).and_return(mock_events(:save => true))
        post :create, :events => {:these => 'params'}
        assigns[:events].should equal(mock_events)
      end

      it "redirects to the created events" do
        Events.stub!(:new).and_return(mock_events(:save => true))
        post :create, :events => {}
        response.should redirect_to(event_url(mock_events))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved events as @events" do
        Events.stub!(:new).with({'these' => 'params'}).and_return(mock_events(:save => false))
        post :create, :events => {:these => 'params'}
        assigns[:events].should equal(mock_events)
      end

      it "re-renders the 'new' template" do
        Events.stub!(:new).and_return(mock_events(:save => false))
        post :create, :events => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested events" do
        Events.should_receive(:find).with("37").and_return(mock_events)
        mock_events.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :events => {:these => 'params'}
      end

      it "assigns the requested events as @events" do
        Events.stub!(:find).and_return(mock_events(:update_attributes => true))
        put :update, :id => "1"
        assigns[:events].should equal(mock_events)
      end

      it "redirects to the events" do
        Events.stub!(:find).and_return(mock_events(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(event_url(mock_events))
      end
    end

    describe "with invalid params" do
      it "updates the requested events" do
        Events.should_receive(:find).with("37").and_return(mock_events)
        mock_events.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :events => {:these => 'params'}
      end

      it "assigns the events as @events" do
        Events.stub!(:find).and_return(mock_events(:update_attributes => false))
        put :update, :id => "1"
        assigns[:events].should equal(mock_events)
      end

      it "re-renders the 'edit' template" do
        Events.stub!(:find).and_return(mock_events(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested events" do
      Events.should_receive(:find).with("37").and_return(mock_events)
      mock_events.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the events list" do
      Events.stub!(:find).and_return(mock_events(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(events_url)
    end
  end

end
