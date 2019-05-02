Rails.application.routes.draw do
  root 'blog#home'

  get 'password_resets/new'
  get 'password_resets/edit'

  get 'sessions/new'

  get 'cabins/details' => 'details#index'
  get 'cabins/map' => 'map#index'
  get 'cabins/kitchen' => 'kitchen#index'

  get 'details' => 'details#index', as: 'details'
  get 'map' => 'map#index', as: 'map'
  get 'kitchen' => 'kitchen#index', as: 'kitchen'

  get 'home' => 'blog#home', as: 'home'
  get 'rules' => 'blog#rules', as: 'rules'
  get 'faq' => 'blog#faq', as: 'faq'

  get 'accommodations' => 'accommodations#index', as: 'accommodations'
  get 'accommodations/:id' => 'accommodations#show', as: 'accommodation'
  patch 'accommodations/:id' => 'accommodations#update'

  post 'quantity/:accommodation_id' => 'reservations#quantity', as: 'quantity'
  post 'confirmation/:accommodation_id' => 'reservations#confirmation', as: 'confirmation'
  get 'reservations/:id' => 'reservations#show', as: 'edit_reservation'
  patch 'reservations/:id' => 'reservations#update', as: 'reservation'
  put 'reservations/:id/cancel' => 'reservations#cancel'

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
  patch 'admin/posts/:id/up' => 'posts#display_up', as: 'post_up'
  patch 'admin/posts/:id/down' => 'posts#display_down', as: 'post_down'
  delete 'admin/posts/:id' => 'posts#delete', as: 'delete_post'

  get 'admin/registrations' => 'registrations#index', as: 'registrations'
  get 'users/:id' => 'users#show', as: 'user'
  get 'users/:id/reservations' => 'users#reservations', as: 'user_reservations'
  patch 'users/:id' => 'users#update'
  patch 'users/:id/tier_approved' => 'users#tier_approved', as: 'tier_approved'

  get 'admin/buildings' => 'buildings#index', as: 'buildings'
  get 'admin/buildings/:id' => 'buildings#show', as: 'building'
  patch 'admin/buildings/:id' => 'buildings#update'

  get 'admin/tiers' => 'tiers#index', as: 'tiers'
  get 'admin/tiers/:id' => 'tiers#show', as: 'tier'
  patch 'admin/tiers/:id' => 'tiers#update'
  patch 'admin/tiers/:id/tier_open_email_confirm' => 'tiers#tier_open_email_confirm', as: 'tier_open_email_confirm'
  patch 'admin/tiers/:id/tier_open_email_send' => 'tiers#tier_open_email_send', as: 'tier_open_email_send'

  get 'admin/instants' => 'instants#index', as: 'instants'
  get 'admin/instants/:id' => 'instants#show', as: 'instant'
  patch 'admin/instants/:id' => 'instants#update'

  get 'admin/reservations' => 'reservations#index', as: 'admin_reservations'
  get 'admin/reservations/:id/payment' => 'reservations#payment', as: 'admin_payment_reservation'
  patch 'admin/reservations/:id' => 'reservations#paid', as: 'admin_paid_reservation'
  delete 'admin/reservations/:id' => 'reservations#delete', as: 'admin_delete_reservation'

  get 'admin/email-logs/tier/:id' => 'email_logs#tier_email_logs', as: 'tier_email_logs'
  get 'admin/email-logs/tier' => 'email_logs#tier_email_logs_all', as: 'tier_email_logs_all'

  resources :password_resets, only: [:new, :create, :edit, :update]
end
