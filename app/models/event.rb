class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def venue_name
    venue.try(:name)
  end

  def self.upcoming
    # http://guides.rubyonrails.org/active_record_querying.html
    where('starts_at > ?', Date.today)
  end
end
