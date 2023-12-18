class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :scheduled_day

  # 選択が「---」では保存できない
  validates :category_id,           numericality: { other_than: 1 }
  validates :status_id,             numericality: { other_than: 1 }
  validates :postage_id,            numericality: { other_than: 1 }
  validates :prefecture_id,         numericality: { other_than: 1 }
  validates :scheduled_day_id,      numericality: { other_than: 1 }

  has_one_attached :image
  belongs_to :user

  validates :image, presence: true

  validates :name,              presence: true
  validates :description,       presence: true
  validates :category_id,       presence: true
  validates :status_id,         presence: true
  validates :postage_id,        presence: true
  validates :prefecture_id,     presence: true
  validates :scheduled_day_id,  presence: true
  validates :price,             presence: true,
                                numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
