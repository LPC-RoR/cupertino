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

  scope module: 'docs_base' do
    resources :area_bases
    resources :asignatura_bases do
      match :asigna_select_elemento, via: :post, on: :collection
      match :desasignar, via: :get, on: :member
    end
    resources :curriculums
    resources :estructuras
    resources :item_bases
    resources :nivel_bases do
      match :inline_nuevo, via: :post, on: :collection
      match :elimina_nivel_base, via: :get, on: :member
      match :asigna_select_elemento, via: :post, on: :collection
      match :desasignar, via: :get, on: :member
    end
    resources :referencias
    resources :requisitos
    resources :documento_bases do
      resources :item_bases
      match :asigna_select_elemento, via: :post, on: :collection
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

  root 'aplicacion/recursos#home'

end
