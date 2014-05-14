class CreateMstMissions < ActiveRecord::Migration
  def change
    create_table :mst_missions do |t|
      t.string :name

      t.timestamps
    end
  end
end
