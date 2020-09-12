class AdImage < ApplicationRecord
  belongs_to :ad
  has_one_attached :image
  scope :cover, lambda { find_by(cover: true) }
end
