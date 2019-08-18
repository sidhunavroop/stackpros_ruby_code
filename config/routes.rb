Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "presidential#index"  # localhost:3000
  get 'create_csv', to: 'presidential#create_csv'  # localhost:3000/create_csv
end
