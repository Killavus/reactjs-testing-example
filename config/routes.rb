Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  resources :test, only: [:index]

  root to: 'test#index'
end
