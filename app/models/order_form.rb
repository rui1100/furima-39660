class OrderForm
  include ActiveModel::Model
  
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number
  
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ } #message: "is invalid"
    validates :prefecture_id, numericality: { other_than: 1 }  #message: "can't be blank"
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ } #message: "is invalid"
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Delivery.create(
      order_id: order.id,
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number
    )
  end
end
