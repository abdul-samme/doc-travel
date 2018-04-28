Rails.application.routes.draw do
  
  
  get 'home/index'

  # Back admin routes start
  authenticate :user do
  namespace :admin do
    resources :visits do
      member do
        get 'print'
        get 'preview'
        get 'payment_edit'


      end
      collection do
        get :debit
        post :debit_payment
      end
    end
    resources :tickets do
      member do
        get 'print'
        get 'preview'
        get 'payment_edit'


      end
      collection do
        get :debit
        post :debit_payment
      end
    end
    resources :users do

    end
    resources :companies do
      member do

        get 'payment_edit'


      end
      collection do
        get :debit
        post :debit_payment
      end
    end
    resources :deals do

    end
    resources :expenses do

    end

    # Admin root
    root to: 'application#index'
  end
  end
  # Back admin routes end

  # Front routes start
  devise_for :users, only: [:session, :registration], path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # Application root
 # root to: 'application#home'
  # Front routes end
 

  root to: 'creatives#index'
end
