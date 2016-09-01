class HoboMigration8 < ActiveRecord::Migration
  def self.up
    change_column :users, :administrator, :boolean, :default => false

    add_column :cursos, :fecha_cierre, :date
  end

  def self.down
    change_column :users, :administrator, :boolean, default: false

    remove_column :cursos, :fecha_cierre
  end
end
