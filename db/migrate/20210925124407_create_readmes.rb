class CreateReadmes < ActiveRecord::Migration[6.1]
  def change
    create_table :readmes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :staging_url
      t.string :production_url
      t.string :repository_url
      t.boolean :keys_required

      t.timestamps
    end
  end
end
