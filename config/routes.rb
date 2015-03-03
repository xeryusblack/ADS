Rails.application.routes.draw do
  get 'varsity_members/index'

  get 'varsity_members/show'

  get 'varsity_members/new'

  get 'varsity_members/create'

  get 'varsity_members/update'

  get 'varsity_members/edit'

  get 'varsity_members/destroy'

  get 'tryout_intents/index'

  get 'tryout_intents/show'

  get 'tryout_intents/new'

  get 'tryout_intents/create'

  get 'tryout_intents/update'

  get 'tryout_intents/edit'

  get 'tryout_intents/destroy'

  get 'training_activities/index'

  get 'training_activities/show'

  get 'training_activities/new'

  get 'training_activities/create'

  get 'training_activities/update'

  get 'training_activities/edit'

  get 'training_activities/destroy'

  get 'officers_in_charge/index'

  get 'officers_in_charge/show'

  get 'officers_in_charge/new'

  get 'officers_in_charge/create'

  get 'officers_in_charge/update'

  get 'officers_in_charge/edit'

  get 'officers_in_charge/destroy'

  get 'debt_settlements/index'

  get 'debt_settlements/show'

  get 'debt_settlements/new'

  get 'debt_settlements/create'

  get 'debt_settlements/update'

  get 'debt_settlements/edit'

  get 'debt_settlements/destroy'

  get 'contingents/index'

  get 'contingents/show'

  get 'contingents/new'

  get 'contingents/create'

  get 'contingents/update'

  get 'contingents/edit'

  get 'contingents/destroy'

  get 'competition_debts/index'

  get 'competition_debts/show'

  get 'competition_debts/new'

  get 'competition_debts/create'

  get 'competition_debts/update'

  get 'competition_debts/edit'

  get 'competition_debts/destroy'

  get 'competitions/index'

  get 'competitions/show'

  get 'competitions/new'

  get 'competitions/create'

  get 'competitions/update'

  get 'competitions/edit'

  get 'competitions/destroy'

  get 'acquired_quota_points/index'

  get 'acquired_quota_points/show'

  get 'acquired_quota_points/new'

  get 'acquired_quota_points/create'

  get 'acquired_quota_points/update'

  get 'acquired_quota_points/edit'

  get 'acquired_quota_points/destroy'

  devise_for :officer_in_charges
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
