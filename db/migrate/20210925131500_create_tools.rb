class CreateTools < ActiveRecord::Migration[6.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :version
      t.text :instructions

      t.timestamps
    end
  end
end
