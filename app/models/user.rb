class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :books, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_books, through: :bookmarks, source: :book

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, uniqueness: true, allow_nil: true

  enum gender: { male: 0, female: 1, other: 2 }
  enum age_group: { under19: 0, twenties: 1, thirties: 2, fourties: 3, fifties: 4, over60: 5 }

  def own?(object)
    self.id == object.user_id
  end

  def bookmark(book)
    bookmark_books << book
  end

  def unbookmark(book)
    bookmark_books.destroy(book)
  end

  def bookmark?(book)
    bookmark_books.include?(book)
  end
end
