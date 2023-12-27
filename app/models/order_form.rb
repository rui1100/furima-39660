class OrderForm
  include ActiveModel::Model

  attr_accessor :token, :item_id, :user_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(item_id:, user_id:)

    Delivery.create(
      order_id: order.id,
      post_code:,
      prefecture_id:,
      city:,
      address:,
      building:,
      phone_number:
    )
  end
end
