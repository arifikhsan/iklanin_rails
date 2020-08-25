class Category < ApplicationRecord
  extend FriendlyId

  has_many :child, class_name: 'Category', foreign_key: :parent_id
  has_many :ads
  belongs_to :parent, class_name: 'Category', optional: true

  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def self.service
    find_by(name: 'Jasa')
  end

  def self.stuff
    find_by(name: 'Barang')
  end
end
