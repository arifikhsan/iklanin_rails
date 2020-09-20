class Ad < ApplicationRecord
  extend FriendlyId

  belongs_to :category
  belongs_to :user
  has_many :ad_images
  alias_attribute :images, :ad_images
  enum status: [:draft, :review, :published, :moderate]
  scope :published, -> { where(status: Ad.statuses[:published]) }
  scope :latest, -> { order(time_start: :asc) }

  friendly_id :title, use: :slugged
  acts_as_paranoid

  after_initialize :set_default_status, :if => :new_record?

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  def set_default_status
    self.status ||= :draft
  end

  def related
    category.ads.published.latest.limit(6)
  end
end
