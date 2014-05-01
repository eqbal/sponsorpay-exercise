require 'spec_helper'

describe Item do
  
  before do  	
  	@item = FactoryGirl.build(:item)
  end


  it "Should belong to an offer" do
  	expect(@item.offer_id).not_to be_nil
  end
  
  it "Should response to offer_types" do
  	expect(@item).to respond_to(:offer_types)
  	expect(@item.offer_types).to be_a(Array)
  end

  it "Should response to thumbnail" do
  	expect(@item).to respond_to(:thumbnail)
  	expect(@item.thumbnail).to be_a(Hash)
  end

  it "Should response to time_to_payout" do
  	expect(@item).to respond_to(:time_to_payout)
  	expect(@item.time_to_payout).to be_a(Hash)
  end

end