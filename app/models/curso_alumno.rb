class CursoAlumno < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end
  attr_accessible :curso, :curso_id, :alumno, :alumno_id

  belongs_to :curso
  belongs_to :alumno

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
