json.array!(@offers) do |offer|
  json.extract! offer, :id, :uid, :pub0, :page
  json.url offer_url(offer, format: :json)
end