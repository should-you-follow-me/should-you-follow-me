ShouldIFollowYou::Application.routes.draw do
  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)

  get "/:id", to: 'users#show'
  root to: "home#index"
end
