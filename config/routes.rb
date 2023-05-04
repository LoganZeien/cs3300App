Rails.application.routes.draw do
  devise_for :users

  # https://levelup.gitconnected.com/how-to-write-custom-routes-in-rails-872df2ca4d39
  # must be above for these reasons: https://stackoverflow.com/questions/50955294/rails-thinks-a-new-route-is-an-id-and-tries-to-use-show-method
  get "/equipment/export" => "equipment#export"

  # https://blog.corsego.com/import-csv-to-rails-database
  post "/equipment/import" => "equipment#import"

  resources :equipment
  root "equipment#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
