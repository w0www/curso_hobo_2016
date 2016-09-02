class Curso < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    titulo :string, :name => true
    fecha  :date
    fecha_cierre :date
    lugar :string
    descripcion :text
    timestamps
  end
  attr_accessible :titulo, :fecha, :alumnos, :lugar, :descripcion, :categories

  set_search_columns :titulo, :lugar

  has_many :category_cursos, :dependent => :destroy
  has_many :categories, :through => :category_cursos, :accessible => true

  has_many :curso_alumnos, :dependent => :destroy
  has_many :alumnos, :through => :curso_alumnos, :accessible => true
  children :alumnos

  # --- Ciclo de vida --- #
  lifecycle :state_field => :estado do
    state :cerrado, :default => :true
    state :abierto
    transition :abrir_curso, { :cerrado => :abierto }, :available_to => :all
    transition :cerrar_curso, { :abierto => :cerrado }, :available_to => :all do
      self.update_attribute(:fecha_cierre, Date.today)
    end
  end
  # --- Asignamos los colores --- #
  def color
    case estado
      when "cerrado"
        "#FFF8B0" #Amarillo
      when "abierto"
        "#A5FFAA" #Verde
      else
        ""
    end
  end

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
