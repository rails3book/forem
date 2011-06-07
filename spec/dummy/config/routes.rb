Rails.application.routes.draw do
  match "/sign_in", :to => "fake#sign_in", :as => "sign_in"
  mount Forem::Engine => "/forem"
end
