require 'spec_helper'

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
    	  SponsorPay::Offer.any_instance
    	  	.stub(:import_offers)
    	  	.and_return(@offers)
    	  @content_items = @offer.import_offers	
    	end

    	it "should get list of content items" do
    		
    	end
    	
    end

    context 'If we have no offers' do
    	
    end
  end
end
