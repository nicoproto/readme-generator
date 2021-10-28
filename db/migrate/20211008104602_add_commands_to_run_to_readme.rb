class AddCommandsToRunToReadme < ActiveRecord::Migration[6.1]
  def change
    add_column :readmes, :commands_to_run, :text
  end
end
