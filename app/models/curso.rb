class Curso < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    titulo :string, :name => true
    fecha  :date
    lugar :string
    descripcion :text
    timestamps
  end
  attr_accessible :titulo, :fecha, :alumnos, :lugar, :descripcion, :categories


  has_many :category_cursos, :dependent => :destroy
  has_many :categories, :through => :category_cursos, :accessible => true

  has_many :alumnos
  children :alumnos

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
