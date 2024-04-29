# frozen_string_literal: true

class MerchandisesController < ApplicationController
  def index
    @merchandises = Merchandise.with_attached_image
  end

  def show
    @merchandise = Merchandise.find(params[:id])
    @merchandises_limit = Merchandise.with_attached_image.order(id: 'DESC').limit(4)
  end

  def new; end

  def edit; end
end
