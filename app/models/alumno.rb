class Alumno < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string, :required, :name => true
    email  :email_address
    telefono :string
    genero enum_string(:masculino, :femenino)
    timestamps
  end

  attr_accessible :nombre, :email, :telefono, :genero, :curso, :curso_id
  
  set_search_columns :nombre, :email, :telefono

  validates_presence_of :telefono, :email

  has_many :curso_alumnos, :dependent => :destroy
  has_many :cursos, :through => :curso_alumnos, :accessible => true

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
