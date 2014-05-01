SponsorPayJsonConsumer::Application.routes.draw do
        
  resources :offers

  root "offers#index"  
  
end
