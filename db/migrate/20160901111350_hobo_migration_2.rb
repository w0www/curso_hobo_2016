class HoboMigration2 < ActiveRecord::Migration
  def self.up
    change_column :users, :administrator, :boolean, :default => false

    add_column :alumnos, :curso_id, :integer

    add_index :alumnos, [:curso_id]
  end

  def self.down
    change_column :users, :administrator, :boolean, default: false

    remove_column :alumnos, :curso_id

    remove_index :alumnos, :name => :index_alumnos_on_curso_id rescue ActiveRecord::StatementInvalid
  end
end
