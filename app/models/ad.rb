class Ad < ApplicationRecord
  belongs_to :user
  has_many :ad_categories
  has_many :categories, through: :ad_categories
end
