require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = create(:user)
  end

  it 'ログインして睡眠習慣ログ一覧ページに遷移する' do
    visit user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'

    expect(page).to have_content '睡眠習慣ログ一覧'
    expect(current_path).to eq logs_path
  end
end