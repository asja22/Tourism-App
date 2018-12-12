Rails.application.routes.draw do
  
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" ,passwords: 'admins/passwords',registrations: 'admins/registrations'}
  get '/admin_home' => 'admins#home' 
  
  devise_for :agents, path: 'agents', controllers: { sessions: "agents/sessions" ,passwords: 'agents/passwords',registrations: 'agents/registrations'}
  get '/agent_home' => 'agents#home' 
  
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" ,passwords: 'users/passwords',registrations: 'users/registrations'}
  
  root 'pages#home'
  
  get 'pages/help'
  get 'pages/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
