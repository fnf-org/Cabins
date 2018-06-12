Rails.application.routes.draw do
  root 'blog#home'

  get 'password_resets/new'
  get 'password_resets/edit'

  get 'sessions/new'

  get 'cabins/details' => 'details#index'
  get 'cabins/map' => 'map#index'

  get 'details' => 'details#index', as: 'details'
  get 'map' => 'map#index', as: 'map'

  get 'home' => 'blog#home', as: 'home'
  get 'rules' => 'blog#rules', as: 'rules'
  get 'faq' => 'blog#faq', as: 'faq'

  get 'accommodations' => 'accommodations#index', as: 'accommodations'
  get 'accommodations/:id' => 'accommodations#show', as: 'accommodation'
  patch 'accommodations/:id' => 'accommodations#update'

  post 'reserve/:accommodation_id' => 'reservations#create', as: 'reserve'
  patch 'reservations/:id/confirmation' => 'reservations#confirmation', as: 'reservation'
  put 'reservations/:id/cancel' => 'reservations#cancel'
  get 'reservations/:id' => 'reservations#show', as: 'edit_reservation'

  get 'users/new', as: 'signup'
  post 'users' => 'users#create'

  get    'login'   => 'sessions#new', as: 'login'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy', as: 'logout'

  get 'admin/index', as: 'admin'

  get 'admin/posts/home' => 'posts#show_home', as: 'admin_home'
  get 'admin/posts/rules' => 'posts#show_rule', as: 'admin_rule'
  get 'admin/posts/faq' => 'posts#show_faq', as: 'admin_faq'

  get 'admin/posts/home/new' => 'posts#new_home', as: 'new_home'
  get 'admin/posts/rules/new' => 'posts#new_rule', as: 'new_rule'
  get 'admin/posts/faq/new' => 'posts#new_faq', as: 'new_faq'

  post 'admin/posts' => 'posts#create', as: 'posts'

  get 'admin/posts/:id' => 'posts#show', as: 'edit_post'
  patch 'admin/posts/:id' => 'posts#update', as: 'post'
  delete 'admin/posts/:id' => 'posts#delete', as: 'delete_post'

  get 'admin/registrations' => 'registrations#index', as: 'registrations'
  get 'users/:id' => 'users#show', as: 'user'
  patch 'users/:id' => 'users#update'
  patch 'users/:id/tier_approved' => 'users#tier_approved', as: 'tier_approved'

  get 'admin/buildings' => 'buildings#index', as: 'buildings'
  get 'admin/buildings/:id' => 'buildings#show', as: 'building'
  patch 'admin/buildings/:id' => 'buildings#update'

  get 'admin/tiers' => 'tiers#index', as: 'tiers'
  get 'admin/tiers/:id' => 'tiers#show', as: 'tier'
  patch 'admin/tiers/:id' => 'tiers#update'

  get 'admin/instants' => 'instants#index', as: 'instants'
  get 'admin/instants/:id' => 'instants#show', as: 'instant'
  patch 'admin/instants/:id' => 'instants#update'

  get 'admin/reservations' => 'reservations#index', as: 'admin_reservations'
  get 'admin/reservations/:id/payment' => 'reservations#payment', as: 'admin_payment_reservation'
  patch 'admin/reservations/:id' => 'reservations#paid', as: 'admin_paid_reservation'
  delete 'admin/reservations/:id' => 'reservations#delete', as: 'admin_delete_reservation'

  resources :password_resets, only: [:new, :create, :edit, :update]
end
