Rails.application.routes.draw do

  root                        'static_pages#home'
  get   '/about',         to: 'static_pages#about'
  
  get   '/commissions',   to: 'commissions#index',   as: 'commissions'
  post  '/commissions',   to: 'commissions#create'
  
  resources :customers do
    resources :commissions
  end

  scope '/customers' do

    #post '/:id/commissions',  to: 'commissions#create'
  end

end
