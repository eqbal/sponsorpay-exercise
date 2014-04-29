module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | SponsorPay JSON Consumer" 
    end
  end
end
