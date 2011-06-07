Forem::Engine.routes.draw do
  resources :topics do
    resources :posts
  end
end