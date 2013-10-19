ShouldIFollowYou::Application.routes.draw do
  get "home/index"

  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)

  root to: "home#index"
end
