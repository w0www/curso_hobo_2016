class Category < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string
    timestamps
  end
  attr_accessible :nombre, :cursos


  has_many :category_cursos, :dependent => :destroy
  has_many :cursos, :through => :category_cursos


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
