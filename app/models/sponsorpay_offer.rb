class SponsorpayOffer
  include ActiveModel::Validations
  
  validates_presence_of :uid, :request_timestamp
  attr_accessor :uid, :request_timestamp
  attr_reader :locale, :page, :pub0

  def initialize(params = {})
    @uid    = params[:uid]
    @locale = params[:locale]
    @pub0   = params[:pub0]
    @page   = params[:page]
    @request_timestamp = params[:timestamp].to_i
  end

  def get_response
    response = sponsorpay_api_call

    begin
      validate_response(response)
      return response  
    rescue Exceptions::FailedResponseValidationError
      return false
    end
  end

  def import_offers
    if valid? 
      if (response = get_response) 
        response.code == 200 ? response.parsed_response["offers"] : [] 
      else 
        []
      end
    else
      raise "uid and request_timestamp must be initialized at least."
    end
  end

  def gather_security_hash_value_pairs
    values = {
      appid: ENV['APPID'],
      uid: @uid,
      ip: ENV['IP'],
      locale: @locale,
      device_id: ENV['DEVICE_ID'],
      pub0: @pub0,
      page: @page,
      timestamp: @request_timestamp.to_i,
      offer_types: ENV['OFFER_TYPES']
    }
    Hash[values.sort]
  end

  def api_request_string
    request_hash = gather_security_hash_value_pairs
    request_hash.to_param+"&hashkey=#{sha1_string}"    
  end

  def sha1_string
    string_to_hash = gather_security_hash_value_pairs.to_param + "&" + ENV['API_KEY']
    Digest::SHA1.hexdigest string_to_hash
  end

  def sponsorpay_api_call
    HTTParty.get("http://api.sponsorpay.com/feed/v1/offers.json?#{api_request_string}")           
  end

  def response_validation_hash(response_body)
    Digest::SHA1.hexdigest response_body+ENV['API_KEY']
  end

  def validate_response(response)
    raise Exceptions::FailedResponseValidationError unless 
    response_validation_hash(response.body) == response.header["X-Sponsorpay-Response-Signature"] 
  end 

end  

