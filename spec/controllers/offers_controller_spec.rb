require 'spec_helper'


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



end
