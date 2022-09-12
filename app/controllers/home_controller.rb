# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  layout 'home'

  def index; end
end
