FactoryGirl.define do
  factory :item do
    title "Title"
    teaser "Teaser"
    required_action "Some Actions"
    link "http://iframe.sponsorpay.com/mbrowser?appid=157&lpid=11387&uid=player1"
    payout "90"
    time_to_payout ({amount: 1800, readable: "30 minutes"})
    offer_id 1
    created_at Time.now     
    offer_types [ ({offer_type_id: 101, readable: "download"}), ({offer_type_id: 112, readable: "free"})]
    thumbnail {{lowres: "http://cdn.sponsorpay.com/assets/1808/icon175x175-2_square_60.png", hires: "http://cdn.sponsorpay.com/assets/1808/icon175x175-2_square_175.png"}}
  end
end
