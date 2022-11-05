# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :redirect_logs_path

  layout 'home'

  def index; end

  def redirect_logs_path
    redirect_to logs_path if user_signed_in?
  end
end
