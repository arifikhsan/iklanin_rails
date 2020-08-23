class Ad < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  has_many :ad_categories
  has_many :categories, through: :ad_categories

  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
