class AddDateToTimeEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :time_entries, :date, :date
    TimeEntry.find_each do |ent|
      ent.update_attributes!(date: ent.start_at.to_date)
    end
    change_column :time_entries, :date, :date, null: false
  end
end
