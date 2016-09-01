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
  
  validates_presence_of :telefono, :email

  belongs_to :curso

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
