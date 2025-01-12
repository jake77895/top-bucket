class AddTextToFlags < ActiveRecord::Migration[7.1]
  def change
    add_column :flags, :text, :string
  end
end
