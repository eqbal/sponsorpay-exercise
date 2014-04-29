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

    	  @items = @offer.get_offers	
    	end

    	it "should get list of content items" do
			expect(@items.size).to eq(2)
    	end

    	it "should create Items associated with the offer" do
    		expect(@offer.items.size).to eq(2)
    	end

    	it "should setup the attributes of Items" do 
    		@offer.items.each_with_index do |item, i|
    			@items[i].keys.each do |attr|
    				expect(item.public_send(attr.to_sym)).to eq(@items[i][attr])
    			end
    		end
    	end

    	it "creates items only if they don't execist" do
    		expect(@offer.get_offers).not_to eq(4)
    	end
    	
    end

    # context 'If we have no offers' do
    	
    # end
  end
end




#       it "only creates content items if they don't already exist" do
#         @offer.get_offers
#         @offer.content_items.should_not have(4).content_items 
#       end

#     end

#     context "with no offers present" do
#       before do
#         no_offers = [] 
#         SponsorPay::MobileOffer.any_instance
#           .should_receive(:get_offers)
#           .and_return(no_offers)
#           @content_items = @offer.get_offers                  
#       end
      
#       it "should not return itmes" do
#         @content_items.should be_empty
#       end

#       it "should not create offer associated content items" do
#         @offer.content_items.should be_empty
#       end
#     end
#   end

# end