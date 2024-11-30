require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションチェック" do
    it "emailとpasswordが存在する場合、有効であること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "email、passwordが存在しない場合、無効であること" do
      user = build(:user, email: "", password: "")
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
      expect(user.errors[:password]).to include('は8文字以上で入力してください')
    end

    it "emailが重複した場合、無効であること" do
      user1 = create(:user)
      user2 = build(:user, email: user1.email)
      user2.valid?
      expect(user2.errors[:email]).to include('はすでに存在します')
    end
  end
end
