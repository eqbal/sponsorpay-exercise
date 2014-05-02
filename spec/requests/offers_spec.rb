require 'spec_helper'

describe "Offer Pages" do
  
  subject { page }

  describe "create new offer" do
    before { visit offers_path }

    let(:submit) {'Submit'}
    
    describe "with invalid params" do
      it "should not create an offer", :js do
        expect { click_button submit }.not_to change(Offer, :count)        
      end
    end


    describe "with valid params" do
      
      before do 
        fill_in "Uid", with: "player1"
        click_button submit
      end

      it "should create an Offer", :js do
        expect change(Offer, :count).by(1)        
      end  

      it "should create an Offer with default params set", :js do
        offer = Offer.find_by_uid("player1")        
        expect(offer.request_timestamp).not_to be_nil
      end

      it "should display the offers page with either no content items, or all content items if present", :js do
        page.should satisfy do
          (page.has_css?(".offer")) || (page.has_css?(".no_offers"))
        end
      end
    end
  
    describe "with page attribute set to a value larger than offer pages coming from the api" do
      before do 
        fill_in "Uid", with: "player1"
        fill_in "Pub0", with: "campaign2"
        fill_in "Page", with: 10_000_000_000
        click_button submit
      end

      it "should not create any content items", :js do
      	items = Offer.find_by_uid("player1")
        expect(items).to be_nil
      end
    end

  end
end
