module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | SponsorPayJsonConsumer"      
    end
  end
end
