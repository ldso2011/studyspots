StudySpots::Application.routes.draw do
  
  get "pages/home"

  get "pages/contact"

  get "pages/about"

  Possible_locales = /en|pt/
  
  match "/:locale" => "pages#home", :locale => Possible_locales
  match "/(:locale)/accounts/:id/join" => "accounts#join"
  match "/(:locale)/spots/:id/inspot" => "spots#inspot"
  match "/(:locale)/accounts/email/:id" => "accounts#email"
  
  root :to=> "accounts#index", :locale => Possible_locales
  
  scope :path => "(:locale)", :shallow_path => "(:locale)", :locale => Possible_locales do
    resources :accounts
    resources :profiles
    resources :spots
  end
  
end
