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

  def sorted_alphabetically(table, sort_criteria, foreign_key=nil, primary_key=nil)
    if foreign_key != nil && primary_key != nil
      table.order(sort_criteria).where("#{foreign_key} = #{primary_key}")
    else
      table.order(sort_criteria)
    end
  end

  def x_shortest(x, table, sort_criteria, foreign_key, primary_key)
    table.order(sort_criteria).where("#{foreign_key} = #{primary_key}").limit(x)
  end

end
