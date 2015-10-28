class Link < ActiveRecord::Base
  validates :url, presence: true
  alias_attribute :date, :created_at

  scope :by_date, -> { order(created_at: :desc) }
end
