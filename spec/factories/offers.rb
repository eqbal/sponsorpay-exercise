FactoryGirl.define do
  factory :offer do
    uid "string"
    pub0 "string"
    page 1
    locale "de"
    request_timestamp Time.now
  end
end
