# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  devise_for :users
  resources :users, only: %i[index show edit update]
  resources :books, only: %i[create index show edit update destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
