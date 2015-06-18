class ChangeDateFormatInDateTable < ActiveRecord::Migration
  def change
    def up
     change_column :funday, :date, :string
    end

    def down
      change_column :funday, :date, :datetime
    end
  end
end
