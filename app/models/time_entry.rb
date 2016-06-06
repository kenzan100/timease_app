class TimeEntry < ApplicationRecord
  scope :ordered, -> { order(:start_at) }

  def self.update_or_create_by_date_with_multiple!(entries)
    where(date: entries.first.start_at.to_date).each do |ent|
      ent.destroy
    end
    entries.each do |ent|
      create!(ent.to_h.merge(date: ent.start_at.to_date))
    end
  end

  def info
    [id, l(start_at), l(end_at), pj_name, task_name]
  end

  def to_output
    TimeEase::Output.new(start_at, end_at, exact, pj_name, task_name)
  end
end
