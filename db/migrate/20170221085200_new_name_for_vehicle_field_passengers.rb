class NewNameForVehicleFieldPassengers < ActiveRecord::Migration[5.0]
  def change
    remove_column :vehicles, :passegners
    add_column :vehicles, :passengers, :string

    remove_column :vehicles, :madel
    add_column :vehicles, :model, :string
  end
end
