class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :ship_fee
  belongs_to :ship_area
  belongs_to :ship_schedule
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of setting range" }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :ship_fee_id
    validates :ship_area_id
    validates :ship_schedule_id
  end

end