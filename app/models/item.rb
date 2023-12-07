class Item < ApplicationRecord
  has_one_attached :image

  validates :name,          presence: true
  validates :description,   presence: true
  validates :category_id,   presence: true
  validates :status_id,     presence: true
  validates :postage_id,    presence: true
  validates :prefecture_id, presence: true
  validates :day_id,        presence: true
  validates :price,         presence: true
end
