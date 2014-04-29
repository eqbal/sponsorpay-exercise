json.array!(@offers) do |offer|
  json.extract! offer, :id, :uid, :pub0, :page, :created_at, :updated_at, :locale, :request_timestamp
  json.url offer_url(offer, format: :json)
end
