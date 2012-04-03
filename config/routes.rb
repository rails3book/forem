Forem::Engine.routes.draw do
  root :to => "topics#index"
  resources :topics do
    resources :posts
  end
end