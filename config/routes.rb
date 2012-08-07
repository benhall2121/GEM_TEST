GEMTEST::Application.routes.draw do
  resources :chk_out_ins

  resources :employees

  resources :assets

 # post "checked_out_assets" => "chk_out_ins#checked_out_assets", :as => "checked_out_assets"

 # post "card_for_user" => "users#card_for_user", :as => "card_for_user"

  get "checked_out_assets" => "chk_out_ins#checked_out_assets", :as => "checked_out_assets"
  get "check_out_asset_return_details" => "chk_out_ins#check_out_asset_return_details", :as => "check_out_asset_return_details"
  get "get_asset" => "chk_out_ins#get_asset", :as => "get_asset"
  get "checkin_asset" => "chk_out_ins#checkin_asset", :as => "checkin_asset"

  root :to => "employees#index"
end
