class RawEntry < ApplicationRecord
  def self.latests(days: 7.days)
    days_range = (days.ago.to_date..Date.today)
    days_range.to_a.map do |day|
      find_or_initialize_by(date: day)
    end
  end
end
