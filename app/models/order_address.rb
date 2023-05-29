class OrderAddress
  include ActiveModel::Model
  #購入内容項目
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number,:user_id, :item_id, :token

  with_options presence: true do
    validates :city
    validates :address
    validates :building_name
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
  end
  
  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
end

