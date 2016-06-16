class CreateRawEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :raw_entries do |t|
      t.date :date, null: false
      t.string :start, null: false, default: ''
      t.string :end,   null: false, default: ''
      t.text :things,  null: false, default: ''
    end

    add_index :raw_entries, :date
  end
end
