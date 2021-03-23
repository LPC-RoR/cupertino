Rails.application.routes.draw do


  # SCOPE APLICACION
  scope module: 'aplicacion' do
    resources :administradores
    resources :mejoras
    resources :observaciones
    resources :perfiles
    resources :recursos do
      collection do
        match :home, via: :get
      end
    end
  end

  # SCOPE HELP
  scope module: 'help' do
    resources :conversaciones
    resources :mensajes
    resources :pasos
    resources :tema_ayudas do
      resources :tutoriales
    end
    resources :tutoriales do
      resources :pasos
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
