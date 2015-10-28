class Reminder < ActiveRecord::Base
  VALID_INTERVAL = 12.hours

  scope :still_valid, -> { where("created_at > ?", VALID_INTERVAL.ago) }
  scope :invalid,     -> { where("created_at <= ?", VALID_INTERVAL.ago) }
  scope :by_date,     -> { order(created_at: :desc) }

  after_create :fetch_title

  # NOTE: Valid is a reserved word.
  def still_valid?
    self.created_at < VALID_INTERVAL.ago
  end

  private

  def fetch_title
    page = MetaInspector.new(self.url)
    if page.title.present?
      self.title = page.title.strip
      save
    end
  end
end
