# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all
  end
end
