class AddImageDataToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :image_data, :text
    add_column :accounts, :description, :text
    add_column :accounts, :website, :string
  end
end
