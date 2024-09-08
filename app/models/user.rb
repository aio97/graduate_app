class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
  
  enum gender: { male: 0, female: 1, other: 2 }
  enum age_group: { under19: 0, twenties: 1, thirties: 2, fourties: 3, fifties: 4, over60: 5 }
end
