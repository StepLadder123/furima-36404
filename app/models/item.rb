class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_choice

  with_options presence: true do
    validates :name
    validates :info
    validates :price
    validates :user, foreign_key: true
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :ship_fee_id
    validates :ship_area_id
    validates :ship_schedule_id
  end
end