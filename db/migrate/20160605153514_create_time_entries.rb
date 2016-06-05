class CreateTimeEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :time_entries do |t|
      t.datetime :start_at,  null: false
      t.datetime :end_at,    null: false
      t.boolean  :exact,     null: false, default: false
      t.string   :pj_name,   null: false
      t.string   :task_name, null: false

      t.timestamps
    end
  end
end
