# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logs', type: :request do
  describe 'GET /logs' do
    let!(:user) { create(:user) }

    context 'when the user is logged in' do
      before { sign_in user }

      subject { get logs_path }

      it 'should render logs index page' do
        subject
        expect(response).to have_http_status(:ok)
      end

      context 'when user has two logs' do
        let!(:logs) { create_list(:log, 2, user:) }

        it 'shoule render log data' do
          subject
          expect(response.body).to include logs.first.score.to_s
          expect(response.body).to include logs.last.score.to_s
        end
      end
    end

    context 'when the user is not logged in' do
      subject { get logs_path }

      it 'redirects to user login page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET /logs/new' do
    let!(:user) { create(:user) }

    context 'when the user is logged in' do
      before { sign_in user }

      subject { get new_log_path }

      it 'should render logs new page' do
        subject
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user is not logged in' do
      subject { get new_log_path }

      it 'redirects to user login page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST /logs' do
    let(:user) { create(:user) }
    let(:question1) { create(:question) }
    let(:question2) { create(:question, content: '質問2') }
    let(:params) do
      {
        log: {
          registered_on: '2022-08-12',
          answers_attributes: {
            '0': {
              question_id: question1.id,
              is_good_habit: true
            },
            '1': {
              question_id: question2.id,
              is_good_habit: true
            }
          }
        }
      }
    end

    context 'when the user is logged in' do
      before { sign_in user }

      subject { post logs_path, params: }

      it 'creates new log' do
        expect { subject }.to change { Log.count }.by(1)
      end

      it 'redirects to logs index page' do
        subject
        expect(response).to redirect_to logs_path
      end
    end

    context 'when the user is not logged in' do
      subject { post logs_path, params: }

      it 'does not create new log' do
        expect { subject }.to change { Log.count }.by(0)
      end

      it 'redirects to user login page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'DELETE /logs/:id' do
    let(:user) { create(:user) }
    let!(:log) { create(:log, user:) }

    context 'when the user is logged in' do
      before { sign_in user }

      subject { delete log_path(log) }

      it 'should delete log' do
        expect { subject }.to change { Log.count }.by(-1)
      end
    end

    context 'when the user is not logged in' do
      subject { delete log_path(log) }

      it 'does not delete log' do
        expect { subject }.to change { Log.count }.by(0)
      end

      it 'redirects to user login page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET /logs/:id/edit' do
    let(:user) { create(:user) }
    let!(:log) { create(:log, user:) }

    context 'when the user is logged in' do
      before { sign_in user }

      subject { get edit_log_path(log) }

      it 'should render logs new page' do
        subject
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user is not logged in' do
      subject { get edit_log_path(log) }

      it 'redirects to user login page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PATCH /logs/:id' do
    let(:user) { create(:user) }
    let!(:log) { create(:log, user:) }
    let(:question1) { create(:question) }
    let(:question2) { create(:question, content: '質問2') }
    let(:params) do
      {
        log: {
          registered_on: '2022-08-12',
          answers_attributes: {
            '0': {
              question_id: question1.id,
              is_good_habit: true
            },
            '1': {
              question_id: question2.id,
              is_good_habit: true
            }
          }
        },
        id: log.id
      }
    end

    context 'when the user is logged in' do
      before { sign_in user }

      subject { patch log_path(log), params: }

      it 'should update log data' do
        subject
        expect(log.reload.registered_on).to eq '2022-08-12'
      end
    end

    context 'when the user is not logged in' do
      subject { patch log_path(log), params: }

      it 'redirects to user login page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
