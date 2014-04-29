require 'spec_helper'
require './app/models/sponsorpay_offer'


describe Offer do  
  before do  	
  	@offer = Offer.create!({
  		uid: 	"my_string", 
  		pub0: 	"my_string",
  		page: 	1,
  		locale: "de",
  		request_timestamp: Time.now
  	})  	
  end


  describe "import_offers" do
    context 'If we have offers ' do
    	before do
    	  @offers = JSON.parse(fake_offers_json)
    	  SponsorPayOffer.any_instance
    	  	.stub(:import_offers)
    	  	.and_return(@offers)
    	  @content_items = @offer.get_offers	
    	end

    	it "should get list of content items" do
			expect(@content_items.size).to eq(2)
    	end
    	
    end

    # context 'If we have no offers' do
    	
    # end
  end
end

