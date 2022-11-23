# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe '睡眠習慣ログ一覧ページのテスト' do
    let!(:user) { create(:user) }
    let!(:question1) { create(:question) }
    let!(:question2) { create(:question, content: '質問2') }

    before do
      visit user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'
    end

    it '睡眠習慣ログ一覧ページが閲覧できる' do
      visit logs_path
      expect(page).to have_content '睡眠習慣ログ一覧'
      expect(current_path).to eq logs_path
    end

    it '良質睡眠チェックリストのページが閲覧できる' do
      visit new_log_path
      expect(page).to have_content '良質睡眠習慣チェックリスト'
      expect(current_path).to eq new_log_path
    end

    it '睡眠習慣ログの登録ができる' do
      visit new_log_path
      expect(page).to have_selector('.form_radio_button', visible: false)
      choose 'はい'
      choose 'いいえ'
      # expect(page).to have_content '睡眠習慣ログ一覧'
      # expect(current_path).to eq logs_path
    end

    # it '睡眠習慣ログ一覧ページから閲覧できる' do

    # end
  end
end