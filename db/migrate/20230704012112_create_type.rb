class CreateType < ActiveRecord::Migration[7.0]
  def change
    create_table :types, id: :integer do |t|
      t.string :name
      t.timestamps
    end
  end
end
