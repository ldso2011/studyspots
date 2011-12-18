StudySpots::Application.routes.draw do
  Possible_locales = /en|pt/
  namespace "users" , :path => "(:locale)/users", :locale => Possible_locales do
    resources :disciplines, :controller => "disciplines"
    resources :profile, :controller => "profile"
  end

  scope :path => "(:locale)/administration", :locale => Possible_locales do
    resources :faculties, :controller => "administration/faculties"
    resources :courses, :controller => "administration/courses"
    resources :disciplines, :controller => "administration/disciplines"
  end
  
  scope :path => "(:locale)", :locale => Possible_locales do
    resources :spots
  end
  
  devise_for :users, :path => "(:locale)", :locale => Possible_locales, :path_names => { 
    :sign_up => "register",
    :sign_in => "login",
    :sign_out => "logout"
  }

  scope :path => "(:locale)", :locale => Possible_locales do
     match '/about' => "pages#about"
     match '/administration' => "pages#administration"
     match '/contact' => "pages#contact"
     match '/privacy' => "pages#privacy"
     root :to => "pages#home"
  end
  match '(:locale)/users/profile/new' => "users/profile#create" 
  match '(:locale)/users/disciplines/:id/spots' => "users/disciplines#spots" 
  match '(:locale)/users/disciplines/:id/show' => "users/disciplines#show"
  match '(:locale)/users/disciplines/:id/spots/:id2/join' => "users/disciplines#join"
  match '(:locale)/users/disciplines/:id/spots/:id2/leave' => "users/disciplines#leave"
  match '(:locale)/users/disciplines/:id/delete' => "users/disciplines#destroy" 
  match '(:locale)/users/disciplines/new' => "users/disciplines#create" 
  
end
