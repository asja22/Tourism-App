Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" ,passwords: 'admins/passwords',registrations: 'admins/registrations'}
  get '/admin_home', to: 'admins#home' 
  
  devise_for :agents, path: 'agents', controllers: { sessions: "agents/sessions" ,passwords: 'agents/passwords',registrations: 'agents/registrations'}
  get '/agent_home', to: 'agents#home' 
  resources :agents , only: [:index,:show]
  
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" ,passwords: 'users/passwords',registrations: 'users/registrations'}
  resources :users , only: [:index,:show]
  
  
  root 'pages#home'
  
  get '/help', to: 'pages#help'
  get '/contact', to: 'pages#contact'
  
  resources :packages
  get '/new', to: 'packages#new'
  get '/packages_home', to: 'packages#home'
  get '/approval', to: 'packages#approval'
  put 'approve/:id', to: 'packages#approve', as: :approve #(approve_path in approval.html.erb)
  get '/packages_agent/:id', to: 'packages#packages_agent', as: :packages_agent

  #get '/packages_new', to:'packages#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
