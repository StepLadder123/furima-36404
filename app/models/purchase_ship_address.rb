class PurchaseShipAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :build_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Input 8 half-width characters (include hyphen(-))."}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}+\z/, message: "is invalid. Input 10 or 11 half-width characters (not include hyphen(-))."}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShipAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, build_name: build_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end