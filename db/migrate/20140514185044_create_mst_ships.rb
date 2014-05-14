class CreateMstShips < ActiveRecord::Migration
  def change
    create_table :mst_ships do |t|
      t.string :name

      t.timestamps
    end
  end
end
