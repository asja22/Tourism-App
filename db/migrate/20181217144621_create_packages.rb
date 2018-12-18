class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :days
      t.integer :nights
      t.integer :departure
      t.integer :country_id
      t.integer :province_id
      t.text :itinerary
      t.decimal :price
      t.string :includes
      t.references :agent, foreign_key: true
      
      t.timestamps
    end
    add_index :packages, [:agent_id, :created_at]
  end
end
