class HoboMigration4 < ActiveRecord::Migration
  def self.up
    change_column :users, :administrator, :boolean, :default => false

    add_column :alumnos, :telefono, :string
    add_column :alumnos, :genero, :string
  end

  def self.down
    change_column :users, :administrator, :boolean, default: false

    remove_column :alumnos, :telefono
    remove_column :alumnos, :genero
  end
end
