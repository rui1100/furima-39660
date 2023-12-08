class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :day

  # 選択が「---」では保存できない
  validates :category_id,   numericality: { other_than: 1 }
  validates :status_id,     numericality: { other_than: 1 }
  validates :postage_id,    numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_id,        numericality: { other_than: 1 }

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
