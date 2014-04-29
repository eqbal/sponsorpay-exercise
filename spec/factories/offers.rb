FactoryGirl.define do
  factory :offer do
    uid "my_string"
    pub0 "my_string"
    page 1
    locale "de"
    request_timestamp Time.now
  end
end
