class Item < ApplicationRecord
  extend FriendlyId

  belongs_to :category
  belongs_to :user
  has_many :item_images
  alias_attribute :images, :item_images
  enum status: [:draft, :review, :published, :moderate]

  friendly_id :title, use: :slugged
  acts_as_paranoid
  after_initialize :set_default_status, if: :new_record?

  scope :latest, -> { order(created_at: :desc) }
  scope :status_draft, -> { where(status: Item.statuses[:draft]) }
  scope :status_published, -> { where(status: Item.statuses[:published]) }
  scope :current_displayed, -> { where('time_start < ? AND time_end > ?', Time.now, Time.now) }

  scope :show_active, -> { status_published.latest.current_displayed }
  scope :show_draft, -> { status_draft.latest.current_displayed }

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  def set_default_status
    self.status ||= :draft
  end

  def related
    category.items.where.not(id: id).show_active.limit(6)
  end
end
