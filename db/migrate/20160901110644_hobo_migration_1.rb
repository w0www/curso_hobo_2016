class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :alumnos do |t|
      t.string   :nombre
      t.string   :email
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :cursos do |t|
      t.string   :titulo
      t.date     :fecha
      t.datetime :created_at
      t.datetime :updated_at
    end

    change_column :users, :administrator, :boolean, :default => false
  end

  def self.down
    change_column :users, :administrator, :boolean, default: false

    drop_table :alumnos
    drop_table :cursos
  end
end
