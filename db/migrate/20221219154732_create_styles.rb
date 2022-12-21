class CreateStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :styles do |t|
      t.text :name
      t.integer :beer_id

      t.timestamps
    end
  end
end
