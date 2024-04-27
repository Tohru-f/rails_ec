# frozen_string_literal: true

class MerchandisesController < ApplicationController
  def index
    @merchandises = Merchandise.all
  end

  def show
    @merchandises = Merchandise.all
    @id = params[:id]
    @merchandises_limit = Merchandise.all.order(id: 'DESC').limit(4)
  end

  def new; end

  def edit; end
end
