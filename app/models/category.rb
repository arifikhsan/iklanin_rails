class Category < ApplicationRecord
  has_many :subcategories, class_name: 'Category', foreign_key: :parent_id
  has_many :ad_categories
  has_many :ads, through: :ad_categories
  belongs_to :parent, class_name: 'Category', optional: true

  alias_attribute :subs, :subcategories
  alias_attribute :parent_category, :parent
end
