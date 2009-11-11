require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlansController do

  def mock_plan(stubs={})
    @mock_plan ||= mock_model(Plan, stubs)
  end

  before(:each) do
    @user = Factory.build(:user)
    controller.stub!(:current_user).and_return(@user)
    @plans = [mock_plan]
    @user.stub!(:plans).and_return(@plans)
  end

  describe "GET index" do
    it "assigns all plans as @plans" do
      get :index
      assigns[:plans].should == [mock_plan]
    end
  end

  describe "GET show" do
    it "assigns the requested plan as @plan" do
      @plans.stub!(:find).with("37").and_return(mock_plan)
      get :show, :id => "37"
      assigns[:plan].should equal(mock_plan)
    end
  end

  describe "GET new" do
    it "assigns a new plan as @plan" do
      @plans.stub!(:new).and_return(mock_plan)
      get :new
      assigns[:plan].should equal(mock_plan)
    end
  end

  describe "GET edit" do
    it "assigns the requested plan as @plan" do
      @plans.stub!(:find).with("37").and_return(mock_plan)
      get :edit, :id => "37"
      assigns[:plan].should equal(mock_plan)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      before(:each) do
        @mock_plan.stub!(:save => true)
      end
      
      it "assigns a newly created plan as @plan" do
        @plans.stub!(:new).with({'these' => 'params'}).and_return(mock_plan)
        post :create, :plan => {:these => 'params'}
        assigns[:plan].should equal(mock_plan)
      end

      it "redirects to the created plan" do
        @plans.stub!(:new).and_return(mock_plan)
        post :create, :plan => {}
        response.should redirect_to(plan_url(mock_plan))
      end
    end

    describe "with invalid params" do
      before(:each) do
        @mock_plan.stub!(:save => false)
      end
      
      it "assigns a newly created but unsaved plan as @plan" do
        @plans.stub!(:new).with({'these' => 'params'}).and_return(mock_plan)
        post :create, :plan => {:these => 'params'}
        assigns[:plan].should equal(mock_plan)
      end

      it "re-renders the 'new' template" do
        @plans.stub!(:new).and_return(mock_plan)
        post :create, :plan => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      before(:each) do
        @mock_plan.stub!(:update_attributes => true)
      end
      
      it "updates the requested plan" do
        @plans.should_receive(:find).with("37").and_return(mock_plan)
        mock_plan.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :plan => {:these => 'params'}
      end

      it "assigns the requested plan as @plan" do
        @plans.stub!(:find).and_return(mock_plan(:update_attributes => true))
        put :update, :id => "1"
        assigns[:plan].should equal(mock_plan)
      end

      it "redirects to the plan" do
        @plans.stub!(:find).and_return(mock_plan(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(plan_url(mock_plan))
      end
    end

    describe "with invalid params" do
      before(:each) do
        @mock_plan.stub!(:update_attributes => false)
      end
      
      it "updates the requested plan" do
        @plans.should_receive(:find).with("37").and_return(mock_plan)
        mock_plan.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :plan => {:these => 'params'}
      end

      it "assigns the plan as @plan" do
        @plans.stub!(:find).and_return(mock_plan(:update_attributes => false))
        put :update, :id => "1"
        assigns[:plan].should equal(mock_plan)
      end

      it "re-renders the 'edit' template" do
        @plans.stub!(:find).and_return(mock_plan(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested plan" do
      @plans.should_receive(:find).with("37").and_return(mock_plan)
      mock_plan.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the plans list" do
      @mock_plan.stub!(:destroy => true)
      @plans.stub!(:find).and_return(mock_plan(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(plans_url)
    end
  end

end
