class AddDescriptionToStyles < ActiveRecord::Migration[7.0]
  def change
    add_column :styles, :description, :text
  end
end
