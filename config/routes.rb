# frozen_string_literal: true

Rails.application.routes.draw do
  root 'counter#show'

  get  '/cluster', to: 'cluster#new'
  post '/cluster', to: 'cluster#create'
end
