class OffersController < ApplicationController

  def index
    @offers = Offer.all
    @offer  = Offer.new
  end

  def create    
    return unless request.xhr?

    @offer = Offer.new(offer_params_with_defaults)
    
    respond_to do |format|
      format.js
    end
  end

  

  private
      
  def offer_params
    params.require(:offer).permit(:uid, :pub0, :page)
  end

  def offer_params_with_defaults
    offer_params.merge({
      locale: SP_CONFIG['LOCALE'], 
      request_timestamp: Time.now
    })
  end


end
