# frozen_string_literal: true

class AccountAuthenticationsController < ApplicationController
  before_action :authenticate_user!, except: [:sent]
  layout 'static_page'

  def sent; end
end
