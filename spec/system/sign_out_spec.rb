require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'ログアウトのテスト' do
    let!(:user) { create(:user) }

    before do
      visit user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_on 'ログイン'
    end

    it 'ログアウトしてトップページに遷移する' do
      visit edit_user_registration_path
      click_on 'ログアウト'

      expect(page).to have_content 'ログアウトしました。'
      expect(page).to have_content '良い睡眠習慣を身につけよう'
      expect(current_path).to eq root_path
    end
  end
end
