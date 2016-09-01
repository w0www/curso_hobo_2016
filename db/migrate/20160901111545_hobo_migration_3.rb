class HoboMigration3 < ActiveRecord::Migration
  def self.up
    change_column :users, :administrator, :boolean, :default => false

    add_column :cursos, :lugar, :string
    add_column :cursos, :descripcion, :text
  end

  def self.down
    change_column :users, :administrator, :boolean, default: false

    remove_column :cursos, :lugar
    remove_column :cursos, :descripcion
  end
end
