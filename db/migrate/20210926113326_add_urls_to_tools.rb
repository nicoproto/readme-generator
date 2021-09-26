class AddUrlsToTools < ActiveRecord::Migration[6.1]
  def change
    add_column :tools, :website_url, :string
    add_column :tools, :repository_url, :string
  end
end
