class ChangeDepartureToStringInPackages < ActiveRecord::Migration[5.2]
  def change
    change_column :packages, :departure, :string
  end
end
