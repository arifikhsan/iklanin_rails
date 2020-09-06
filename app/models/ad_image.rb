class AdImage < ApplicationRecord
  belongs_to :ad
  has_one_attached :image
end
