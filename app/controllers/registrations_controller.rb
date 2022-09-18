# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def after_inactive_sign_up_path_for(_resource)
    account_authentications_sent_path
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
