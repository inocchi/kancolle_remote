class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses, options: '; ALTER TABLE responses ADD UNIQUE (api);' do |t|
      t.string :api, null: false
      t.string :response

      t.timestamps
    end
  end
end
