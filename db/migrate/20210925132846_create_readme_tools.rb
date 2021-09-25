class CreateReadmeTools < ActiveRecord::Migration[6.1]
  def change
    create_table :readme_tools do |t|
      t.references :readme, null: false, foreign_key: true
      t.references :tool, null: false, foreign_key: true
      t.text :comments

      t.timestamps
    end
  end
end
