class SponsorpayOffer
  include ActiveModel::Validations
  
  attr_accessor :uid, :request_timestamp
  attr_reader :locale, :page, :pub0

  validates_presence_of :uid, :request_timestamp

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

  def generate_security_values
    values = {
      appid:       SP_CONFIG['APPID'],
      uid:         @uid,
      ip:          SP_CONFIG['IP'],
      locale:      @locale,
      device_id:   SP_CONFIG['DEVICE_ID'],
      pub0:        @pub0,
      page:        @page,
      timestamp:   @request_timestamp.to_i,
      offer_types: SP_CONFIG['OFFER_TYPES']
    }
    Hash[values.sort]
  end

  def api_request_string
    request_hash = generate_security_values
    request_hash.to_param+"&hashkey=#{sha1_string}"    
  end

  def sha1_string
    string_to_hash = generate_security_values.to_param + "&" + SP_CONFIG['API_KEY']
    Digest::SHA1.hexdigest string_to_hash
  end

  def sponsorpay_api_call
    HTTParty.get("http://api.sponsorpay.com/feed/v1/offers.json?#{api_request_string}")           
  end

  def response_validation_hash(response_body)
    Digest::SHA1.hexdigest response_body+SP_CONFIG['API_KEY']
  end

  def validate_response(response)
    raise Exceptions::FailedResponseValidationError unless 
    response_validation_hash(response.body) == response.header["X-Sponsorpay-Response-Signature"] 
  end 

end  

