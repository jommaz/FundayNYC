class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.references :funday, index: true, foreign_key: true
      t.string :name
      t.string :desc
      t.timestamp :starttime
      t.timestamp :endtime
      t.datetime :date

      t.timestamps null: false
    end
  end
end
