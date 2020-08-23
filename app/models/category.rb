class Category < ApplicationRecord
  extend FriendlyId

  has_many :subcategories, class_name: 'Category', foreign_key: :parent_id
  has_many :ad_categories
  has_many :ads, through: :ad_categories
  belongs_to :parent, class_name: 'Category', optional: true

  alias_attribute :subs, :subcategories
  alias_attribute :parent_category, :parent

  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
