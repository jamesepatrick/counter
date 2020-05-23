# frozen_string_literal: true

Rails.application.routes.draw do
  root 'counter#show'

  get  '/cluster', to: 'cluster#show'
  post '/cluster', to: 'cluster#create'

  get '/cluster/:uuid', to: 'counter#show'
end
