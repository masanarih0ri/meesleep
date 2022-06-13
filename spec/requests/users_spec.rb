# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }
  before { sign_in user }

  describe 'GET /users/edit' do
    subject { get edit_user_registration_path }

    it 'renders user edit page' do
      subject
      expect(response).to have_http_status(:ok)
    end
  end
end
