class ItemImage < ApplicationRecord
  belongs_to :item
  has_one_attached :image
  scope :cover, lambda { find_by(cover: true) }
end
