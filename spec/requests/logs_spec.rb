# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logs', type: :request do
  # TODO ログインしていないときの挙動も後でテストに追加する
  describe 'GET /logs' do
    let!(:user) { create(:user) }

    context 'when the user is logged in' do
      before { sign_in user }

      subject { get logs_path }

      it 'should render logs index page' do
        subject
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user is not logged in' do

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

    end
  end

  describe 'POST /logs' do
    let(:user) { create(:user) }
    let(:question1) { create(:question) }
    let(:question2) { create(:question, content: '質問2') }
    let(:params) do
      {
        log: {
          user_id: user.id,
          score: 40,
          registered_on: "2022-08-12"
        },
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
    end

    context 'when the user is logged in' do
      before { sign_in user }

      subject { post logs_path, params: params }

      it 'creates new log' do
        expect { subject }.to change { Log.count }.by(1)
      end

      it 'redirects to logs index page' do
        subject
        expect(response).to redirect_to logs_path
      end
    end

    context 'when the user is not logged in' do

    end
  end
end
# Parameters: {"authenticity_token"=>"[FILTERED]", "log"=>{"user_id"=>"1", "score"=>"40", "registered_on"=>"2022-08-18", "answers_attributes"=>{"0"=>{"question_id"=>"1", "is_good_habit"=>"true"}, "1"=>{"question_id"=>"2", "is_good_habit"=>"false"}}}, "commit"=>"登録する"}