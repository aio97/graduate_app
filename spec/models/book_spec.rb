require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "バリデーションチェック" do
    it "タイトルが存在する場合、有効であること" do
      book = build(:book)
      expect(book).to be_valid
    end

    it "タイトルが存在しない場合、無効であること" do
      book = build(:book, title: nil)
      expect(book).to be_invalid
      expect(book.errors[:title]).to include("を入力してください")
    end

    it "タイトルが255文字以下の場合、無効であること" do
      book = build(:book, title: "a" * 255)
      expect(book).to be_valid
    end

    it "タイトルが256文字以上の場合、無効であること" do
      book = build(:book, title: "a" * 256)
      expect(book).to be_invalid
      expect(book.errors[:title]).to include("は255文字以内で入力してください")
    end
  end
end
