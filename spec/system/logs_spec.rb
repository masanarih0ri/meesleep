# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe '睡眠習慣ログ一覧ページのテスト' do
    let!(:user) { create(:user) }
    let!(:question1) { create(:question) }
    let!(:question2) { create(:question, content: '質問2') }
    let!(:log) { create(:log, user:) }

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

    it '睡眠習慣ログ編集ページが閲覧できる' do
      visit edit_log_path(log)
      expect(page).to have_content '睡眠習慣ログの編集'
    end

    def choose_yes
      labels = all('.form_radio_label')
      labels[0].click
    end

    def choose_no
      labels = all('.form_radio_label')
      labels[1].click
    end

    it '睡眠習慣ログの登録ができる' do
      visit new_log_path
      questions = all('.form_item_buttons')
      within questions[0] do
        choose_yes
      end
      within questions[1] do
        choose_no
      end
      click_on '登録する'
      expect(page).to have_content '睡眠習慣ログ一覧'
      expect(current_path).to eq logs_path
    end

    # it '睡眠習慣ログが編集できる' do

    # end

    it '睡眠習慣ログが削除できる' do
      visit edit_log_path(log)
      page.accept_confirm do
        click_on '削除'
      end
      expect(page).to have_content 'ログを削除しました'
      expect(current_path).to eq logs_path
    end
  end
end