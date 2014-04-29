require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe OffersController do

  # This should return the minimal set of attributes required to create a valid
  # Offer. As you add validations to Offer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "uid" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OffersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all offers as @offers" do
      offer = Offer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:offers).should eq([offer])
    end
  end

  describe "GET show" do
    it "assigns the requested offer as @offer" do
      offer = Offer.create! valid_attributes
      get :show, {:id => offer.to_param}, valid_session
      assigns(:offer).should eq(offer)
    end
  end

  describe "GET new" do
    it "assigns a new offer as @offer" do
      get :new, {}, valid_session
      assigns(:offer).should be_a_new(Offer)
    end
  end

  describe "GET edit" do
    it "assigns the requested offer as @offer" do
      offer = Offer.create! valid_attributes
      get :edit, {:id => offer.to_param}, valid_session
      assigns(:offer).should eq(offer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Offer" do
        expect {
          post :create, {:offer => valid_attributes}, valid_session
        }.to change(Offer, :count).by(1)
      end

      it "assigns a newly created offer as @offer" do
        post :create, {:offer => valid_attributes}, valid_session
        assigns(:offer).should be_a(Offer)
        assigns(:offer).should be_persisted
      end

      it "redirects to the created offer" do
        post :create, {:offer => valid_attributes}, valid_session
        response.should redirect_to(Offer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved offer as @offer" do
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        post :create, {:offer => { "uid" => "invalid value" }}, valid_session
        assigns(:offer).should be_a_new(Offer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        post :create, {:offer => { "uid" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested offer" do
        offer = Offer.create! valid_attributes
        # Assuming there are no other offers in the database, this
        # specifies that the Offer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Offer.any_instance.should_receive(:update).with({ "uid" => "MyString" })
        put :update, {:id => offer.to_param, :offer => { "uid" => "MyString" }}, valid_session
      end

      it "assigns the requested offer as @offer" do
        offer = Offer.create! valid_attributes
        put :update, {:id => offer.to_param, :offer => valid_attributes}, valid_session
        assigns(:offer).should eq(offer)
      end

      it "redirects to the offer" do
        offer = Offer.create! valid_attributes
        put :update, {:id => offer.to_param, :offer => valid_attributes}, valid_session
        response.should redirect_to(offer)
      end
    end

    describe "with invalid params" do
      it "assigns the offer as @offer" do
        offer = Offer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        put :update, {:id => offer.to_param, :offer => { "uid" => "invalid value" }}, valid_session
        assigns(:offer).should eq(offer)
      end

      it "re-renders the 'edit' template" do
        offer = Offer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        put :update, {:id => offer.to_param, :offer => { "uid" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested offer" do
      offer = Offer.create! valid_attributes
      expect {
        delete :destroy, {:id => offer.to_param}, valid_session
      }.to change(Offer, :count).by(-1)
    end

    it "redirects to the offers list" do
      offer = Offer.create! valid_attributes
      delete :destroy, {:id => offer.to_param}, valid_session
      response.should redirect_to(offers_url)
    end
  end

end