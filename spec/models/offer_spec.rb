require 'spec_helper'
require './app/models/sponsorpay_offer'


describe Offer do  
  before do  	
  	@offer = FactoryGirl.build(:offer)
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
    		expect(@offer.get_offers.size).not_to eq(4)
    	end
    	
    end


    context 'If we have no offers' do
      	before do
        	no_offers = [] 
        	SponsorPayOffer.any_instance
          	.should_receive(:import_offers)
          	.and_return(no_offers)
          	@items = @offer.get_offers                  
      	end

      	it "should not return any items" do
      		expect(@items).to be_empty
      	end

      	it "shoudn't create any associated items with the offer" do
      		expect(@offer.items).to be_empty
      	end
		    	
    end
  end
end