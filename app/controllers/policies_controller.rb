# frozen_string_literal: true

class PoliciesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index; end
end
