class FrontController < ApplicationController

  hobo_controller

  def index
    @total_alumnos = Alumno.count
    @total_cursos = Curso.count
  end

  def summary
    if !current_user.administrator?
      redirect_to user_login_path
    end
  end

  def search
    if params[:query]
      site_search(params[:query])
    end
  end

end
