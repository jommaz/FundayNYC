class CreateFundays < ActiveRecord::Migration
  def change
    create_table :fundays do |t|
      t.string :name
      t.datetime :date

      t.timestamps null: false
    end
  end
end
