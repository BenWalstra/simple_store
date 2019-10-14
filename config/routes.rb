# frozen_string_literal: true

Rails.application.routes.draw do
  get 'products', to: 'products#index'
end