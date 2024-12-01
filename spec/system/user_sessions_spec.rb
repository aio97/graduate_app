require "rails_helper"

# RSpec.describe "UserSessions", type: :system do
#   let(:user) { create(:user, password: "password") }

#   describe "ログイン処理" do
#     it 'email、passwordを入力した場合、ログイン処理が成功すること' do
#       visit login_path
#       fill_in "email", with: user.email
#       fill_in "password", with: "password"
#       click_button "ログイン"
#       expect(page).to have_content "ログインしました"
#       expect(current_path).to eq root_path
#     end
#   end
# end

RSpec.describe "UserSessions", type: :system do
  before do
    driven_by :selenium_chrome_headless
  end

  let(:user) { create(:user, password: "password") }

  describe "ログイン処理" do
    it 'email、passwordを入力した場合、ログイン処理が成功すること' do
      visit login_path
      fill_in "email", with: user.email
      fill_in "password", with: "password"
      click_button "ログイン"
      expect(page).to have_content "ログインしました"
      expect(current_path).to eq root_path
    end
  end
end