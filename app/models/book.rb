class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :outline_title, length: { maximum: 255 }
  validates :outline_body, length: { maximum: 65_535 }
  validates :is_public, inclusion: { in: [ true, false ] }

  belongs_to :user
  has_many :plans, dependent: :destroy

  accepts_nested_attributes_for :plans, allow_destroy: true
end
