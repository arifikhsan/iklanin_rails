class Ad < ApplicationRecord
  extend FriendlyId

  belongs_to :category
  belongs_to :user
  has_many :ad_images
  alias_attribute :images, :ad_images
  enum status: [:draft, :review, :published, :moderate]
  scope :active, -> { where(:status => Ad.statuses[:active])}

  friendly_id :title, use: :slugged
  acts_as_paranoid

  after_initialize :set_default_status, :if => :new_record?

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  def set_default_status
    self.status ||= :draft
  end
end
