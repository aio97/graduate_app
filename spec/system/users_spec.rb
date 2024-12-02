require 'rails_helper'

RSpec.describe "Users", type: :system do
  include LoginMacros
  let(:user) { create(:user) }

  describe "ログイン前"
    context "新規登録" do
      it "フォームの入力値が正常の場合、新規登録が成功すること" do
        visit new_user_path
        fill_in "メールアドレス", with: "email@example.com"
        fill_in "パスワード", with: "password"
        fill_in "パスワード確認", with: "password"
        click_button "登録"
        expect(page).to have_content "ユーザー登録が完了しました"
        expect(current_path).to eq books_path
      end

      it "メールアドレスが未入力の場合、新規登録が失敗すること" do
        visit new_user_path
        fill_in "メールアドレス", with: ""
        fill_in "パスワード", with: "password"
        fill_in "パスワード確認", with: "password"
        click_button "登録"
        expect(page).to have_content "メールアドレスを入力してください"
        expect(current_path).to eq new_user_path
      end

      it "登録済のメールアドレスを入力をした場合、新規登録が失敗すること" do
        user1 = create(:user)
        visit new_user_path
        fill_in "メールアドレス", with: user1.email
        fill_in "パスワード", with: "password"
        fill_in "パスワード確認", with: "password"
        click_button "登録"
        expect(page).to have_content "メールアドレスはすでに存在します"
        expect(current_path).to eq new_user_path
      end
    end

    context "マイページ/登録情報" do
      it "アクセスに失敗すること" do
        visit profile_path(user)
        expect(current_path).to eq login_path
      end
    end
  end

  describe "ログイン後" do
    before { login_as(user) }

    context "マイページ/登録情報" do
      it "登録情報編集ページでフォームの入力値が正常の場合、登録情報の更新に成功" do
        visit edit_profile_path(user)
        fill_in "メールアドレス", with: "update@example.com"
        click_button "更新"
        expect(page).to have_content "登録情報を更新しました"
        expect(current_path).to eq profile_path(user)
      end
      it "登録情報編集ページで登録済のメールアドレスを入力をした場合、登録情報の更新に失敗すること"
      it "他のユーザーの登録情報ページにアクセスした場合、アクセスが失敗すること"
      it "他のユーザーの登録情報編集ページにアクセスした場合、アクセスが失敗すること"
  end
end
