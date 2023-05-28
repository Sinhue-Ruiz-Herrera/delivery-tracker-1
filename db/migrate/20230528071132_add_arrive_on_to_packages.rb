class AddArriveOnToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :arrive_on, :date
  end
end
