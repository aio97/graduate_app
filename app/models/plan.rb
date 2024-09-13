class Plan < ApplicationRecord
  validates :title, length: { maximum: 255 }
  validates :location, length: { maximum: 255 }
  validates :detail, length: { maximum: 65_535 }
  validates :memo, length: { maximum: 65_535 }
  validates :cost_display_per, inclusion: { in: [ true, false ] }, allow_nil: true
  validates :cost_display_total, inclusion: { in: [ true, false ] }, allow_nil: true

  belongs_to :book
end
