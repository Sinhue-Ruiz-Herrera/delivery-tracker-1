class AddDescriptionToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :description, :string
  end
end
