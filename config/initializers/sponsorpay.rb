SP_CONFIG = YAML.load_file("#{::Rails.root}/config/sponsorpay.yml")[::Rails.env]
