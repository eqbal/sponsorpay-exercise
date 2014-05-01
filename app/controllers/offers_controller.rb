class OffersController < ApplicationController

  def index
    @offers = Offer.all
    @offer  = Offer.new
  end

  def create    
  end

  
  private
      
  def offer_params
    params.require(:offer).permit(:uid, :pub0, :page, :created_at, :updated_at, :locale, :request_timestamp)
  end

end
