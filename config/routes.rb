Rails.application.routes.draw do

  resources :administradores
  resources :perfiles
  resources :mejoras
  resources :mensajes
  resources :observaciones

  # SCOPE HELP
  scope module: 'help' do
    resources :tema_ayudas do
      resources :tutoriales
    end
    resources :pasos
    resources :tutoriales do
      resources :pasos
    end
  end

  resources :recursos do
    collection do
      match :home, via: :get
    end
  end
  devise_for :usuarios, controllers: {
        confirmations: 'usuarios/confirmations',
#        omniauth_callbacks: 'usuarios/omniauth_callbacks',
        passwords: 'usuarios/passwords',
        registrations: 'usuarios/registrations',
        sessions: 'usuarios/sessions',
        unlocks: 'usuarios/unlocks'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recursos#home'

end
