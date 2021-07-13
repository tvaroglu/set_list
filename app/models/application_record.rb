class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def last_updated
    self.updated_at.strftime("%Y-%m-%d")
  end

  def self.newest_first
    order(created_at: :desc)
  end

  def self.sort_by_recently_created
    order(created_at: :desc)
  end

end
