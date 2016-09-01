class HoboMigration5 < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string   :nombre
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :category_cursos do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :category_id
      t.integer  :curso_id
    end
    add_index :category_cursos, [:category_id]
    add_index :category_cursos, [:curso_id]

    change_column :users, :administrator, :boolean, :default => false
  end

  def self.down
    change_column :users, :administrator, :boolean, default: false

    drop_table :categories
    drop_table :category_cursos
  end
end
