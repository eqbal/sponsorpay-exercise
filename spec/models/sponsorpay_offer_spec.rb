require 'spec_helper'

describe SponsorpayOffer do

  describe "Computing the security hash key" do

    before do
      @sp_offer = SponsorpayOffer.new({
          uid: "player1", 
          pub0: "campaign1", 
          page: 1, 
          locale: "de", 
          timestamp: Time.now
        }) 

      @value_pairs = @sp_offer.generate_security_values
    end


    it "Generates all the parameters" do
      expect(@value_pairs.keys.sort).to eq([:appid, :uid, :ip, :locale, :device_id, :pub0, :page, :timestamp, :offer_types].sort)
    end

    it "orders all the key-value pairs alphabetically" do
        expect(@value_pairs.keys).to eq [:appid, :device_id, :ip, :locale, :offer_types, :page, :pub0, :timestamp, :uid]
    end

    it "Generare long request from all the keys to a param string" do 
      url = "appid=#{SP_CONFIG['APPID']}&device_id=#{SP_CONFIG['DEVICE_ID']}&ip=#{SP_CONFIG['IP']}&" +
            "locale=#{@sp_offer.locale}&offer_types=#{SP_CONFIG['OFFER_TYPES']}&page=#{@sp_offer.page}&" +
            "pub0=#{@sp_offer.pub0}&" +      
            "timestamp=#{@sp_offer.request_timestamp.to_i}&uid=#{@sp_offer.uid}&hashkey=#{@sp_offer.sha1_string}"

      expect(@sp_offer.api_request_string).to eq url                
    end

    it "should return a correct SHA1 Hash String" do
      expect(@sp_offer.sha1_string).to eq( 
        Digest::SHA1.hexdigest @sp_offer.generate_security_values.to_param+"&#{SP_CONFIG['API_KEY']}")
    end
  end

  describe ".import_offers", :vcr do
    context "with valid params" do
      before (:each) do
        @offer = FactoryGirl.build(:offer) 
        offer_params = {
          uid:    @offer.uid,
          locale: @offer.locale,
          pub0:   @offer.pub0,
          page:   @offer.page,
          timestamp: @offer.request_timestamp.to_i
        }
        @sp_offer = SponsorpayOffer.new(offer_params)
        @response = @sp_offer.get_response
      end

      context "with response validation passing" do
        
        it "returns a valid response with status 200 ok" do
          expect(@response).to be_success          
        end

        it "should not raise failed_response_validation error" do
          expect {@sp_offer.validate_response(@response) }.not_to raise_error
        end

        it "should contain offers if the code says OK" do
          if @response.parsed_response["code"] == "OK"
            expect(@response.parsed_response["offers"]).not_to be_empty
            expect(@response.parsed_response["offers"][0].keys).to eq [
              "title", "teaser", "required_action", "link",
              "payout", "time_to_payout", "offer_id", "offer_types","thumbnail"              
            ]
          end          
        end

        it "should contain no offers if the code says NO_CONTENT" do
          if @response.parsed_response["code"] == "NO_CONTENT"
            expect(@response.parsed_response["offers"]).to be_empty
          end
        end        
      end

      context "with response validation not passing" do

        before do
          @response.instance_exec("fake"){ |x| @body = x}
        end
        
        it "should raise response validation error if the response has been modified" do                   
          expect {@sp_offer.validate_response(@response)}.to raise_error       
        end

        it "should return no offers" do
          HTTParty.should_receive(:get).and_return(@response)
          offers = @sp_offer.import_offers
          expect(offers).to be_empty
        end      
      end    
    end
          
    context "calling .get_offers with invalid initialization" do
      it "raises an error" do
        invalid_client = SponsorpayOffer.new
        expect {invalid_client.get_offers}.to raise_error  
      end
      
    end

  end  
end