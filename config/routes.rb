Rails.application.routes.draw do

  resources :pages

  root 'pages#index'
   get "/varsity_members/report", to: "varsity_members#report", as: :report_varsity_members
   get "/varsity_members/report_email", to: "varsity_members#report_email", as: :report_email_varsity_members
  resources :varsity_members
   get "/debt_settlements/:id/confirm", to: "debt_settlements#confirm", as: :category_confirm
  resources :tryout_intents
  resources :training_activities
  resources :debt_settlements
  resources :competitions
  resources :contingents
  resources :acquired_quota_points
  resources :competition_debts
  
  devise_for :officer_in_charges, :path_names => { :sign_up => "debate" }
  # devise_for :officer_in_charges, :skip => [:registrations] 

  # devise_scope :officer_in_charge do
  #   get 'debate' => 'devise/registrations#new', :as => :new_officer_in_charge_registration 
  #   post 'debate' => 'devise/registrations#create', :as => :officer_in_charge_registration
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
