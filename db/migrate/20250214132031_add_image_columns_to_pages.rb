class AddImageColumnsToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :cover_image, :string
    add_column :pages, :profile_image, :string
  end
end
