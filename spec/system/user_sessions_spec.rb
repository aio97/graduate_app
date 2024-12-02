require "rails_helper"

RSpec.describe "UserSessions", type: :system do
  let(:user) { create(:user) }

  describe "ログイン処理" do
    it 'フォームの入力値が正常の場合、ログイン処理が成功すること' do
      visit login_path
      fill_in "email", with: user.email
      fill_in "password", with: "password"
      click_button "ログイン"
      expect(page).to have_content "ログインしました"
      expect(current_path).to eq books_path
    end

    it '存在しないメールアドレスでログインを試みた場合、エラーメッセージが表示されること' do
      visit login_path
      fill_in "email", with: "notfound@example.com"
      fill_in "password", with: "password"
      click_button "ログイン"
      expect(page).to have_content "ログインに失敗しました"
      expect(current_path).to eq login_path
    end

    it '不正なパスワードでログインを試みた場合、エラーメッセージが表示されること' do
      visit login_path
      fill_in "email", with: user.email
      fill_in "password", with: "wrongpassword"
      click_button "ログイン"
      expect(page).to have_content "ログインに失敗しました"
      expect(current_path).to eq login_path
    end
  end
end
