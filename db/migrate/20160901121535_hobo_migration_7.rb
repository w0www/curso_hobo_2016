class HoboMigration7 < ActiveRecord::Migration
  def self.up
    change_column :users, :administrator, :boolean, :default => false

    add_column :cursos, :estado, :string, :default => "cerrado"
    add_column :cursos, :key_timestamp, :datetime

    add_index :cursos, [:estado]
  end

  def self.down
    change_column :users, :administrator, :boolean, default: false

    remove_column :cursos, :estado
    remove_column :cursos, :key_timestamp

    remove_index :cursos, :name => :index_cursos_on_estado rescue ActiveRecord::StatementInvalid
  end
end
