class AddApprovedFieldToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :approved, :boolean, default: false
  end
end
