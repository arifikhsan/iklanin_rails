class Category < ApplicationRecord
  has_many :subcategories, class_name: 'Category', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Category', optional: true
  alias_attribute :subs, :subcategories
  alias_attribute :parent_category, :parent
end
