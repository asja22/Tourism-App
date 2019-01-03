class AddStatusFieldToAgents < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :status, :boolean, default: true
  end
end
