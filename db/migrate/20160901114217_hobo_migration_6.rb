class HoboMigration6 < ActiveRecord::Migration
  def self.up
    create_table :curso_alumnos do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :curso_id
      t.integer  :alumno_id
    end
    add_index :curso_alumnos, [:curso_id]
    add_index :curso_alumnos, [:alumno_id]

    change_column :users, :administrator, :boolean, :default => false

    remove_column :alumnos, :curso_id

    remove_index :alumnos, :name => :index_alumnos_on_curso_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    change_column :users, :administrator, :boolean, default: false

    add_column :alumnos, :curso_id, :integer

    drop_table :curso_alumnos

    add_index :alumnos, [:curso_id]
  end
end
