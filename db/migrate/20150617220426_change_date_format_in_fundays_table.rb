class ChangeDateFormatInFundaysTable < ActiveRecord::Migration
  def self.up
    change_table :fundays do |t|
      t.change :date, :string
    end
  end
  def self.down
    change_table :fundays do |t|
      t.change :date, :datetime
    end
  end
end