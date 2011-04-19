LojaOnline::Application.routes.draw do

  devise_for :users
  resources :users, :has_one => :user_info

  get "pages/home"
  

  namespace "mngr" do
    resources :products, :categories, :assets, :orders
  end
  
  match '/produto/:id/*name', :to => 'pages#product'
  match '/categoria/:id/*name', :to => 'pages#category'

  match '/sacola', :to => 'cart#list'  
  match '/sacola/add', :to => 'cart#add'
  match '/sacola/remove', :to => 'cart#remove'
  match '/sacola/list', :to => 'cart#list'
  match '/sacola/frete', :to => 'cart#frete'
  match '/sacola/logradouro_by_cep', :to => 'cart#logradouro_by_cep'
  match '/sacola/set_frete', :to => 'cart#set_frete'
  match '/sacola/checkout', :to => 'cart#checkout'
  match '/sacola/placeorder', :to => 'cart#placeOrder'


  match '/guia_de_medidas', :to => 'pages#medidas'
  match '/trocas_e_devolucoes', :to => 'pages#trocas_devolucoes'
  match '/prazo_entrega', :to => 'pages#prazo_entrega'
  match '/ajuda', :to => 'pages#ajuda'
  match '/politica_de_privacidade', :to => 'pages#privacidade'
  match '/seguranca', :to => 'pages#seguranca'
  match '/fale_conosco', :to => 'pages#fale_conosco'
  match '/quem_somos', :to => 'pages#quem_somos'
  match '/perguntas_frequentes', :to => 'pages#perguntas_frequentes'
  match '/formas_de_pagamento', :to => 'pages#formas_de_pagamento'
  
  
#  :as => :logout 
  
  root :to => "pages#home"
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
