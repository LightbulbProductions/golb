class Post < ApplicationRecord
  belongs_to :author
  extend FriendlyId
  friendly_id :title, use: :slugged
  scope :most_recent, -> { order(id: :desc) }
  
  def should_generate_new_friendly_id?
    title_changed?
  end
  
  def display_date_published
    "#{created_at.strftime('%-b %-d, %-Y')}"
  end
end
