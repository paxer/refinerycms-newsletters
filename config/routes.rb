Refinery::Application.routes.draw do
  resources :newsletters, :only => [:index, :show]
  match 'unsubscribe' => 'newsletters#unsubscribe', :via => :get

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :newsletters, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
