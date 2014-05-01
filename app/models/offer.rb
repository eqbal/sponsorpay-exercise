class Offer < ActiveRecord::Base
  validates_presence_of :uid
  has_many :items, dependent: :destroy

  def get_offers
    spoonsorpay_offers = SponsorpayOffer.new({
      uid: uid,
      locale: locale,
      pub0: pub0,
      page: page,
      timestamp: request_timestamp.to_i      
      }) 

    items = spoonsorpay_offers.import_offers
    
    items.each do |item|
      unless Item.exists?(title: item["title"])
        self.items.build(item).save
      end  
    end
  end	
end
