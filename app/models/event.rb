class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: { scope: [:venue, :starts_at] }

  scope :published, -> { where.not(published_at: nil) }
  scope :upcoming, -> { where('ends_at > ?', Time.current) }
  scope :search, -> (name) { upcoming.where('name like ?', name) }
end
