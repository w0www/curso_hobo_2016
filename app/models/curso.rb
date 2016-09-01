class Curso < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    titulo :string
    fecha  :date
    timestamps
  end
  attr_accessible :titulo, :fecha

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
