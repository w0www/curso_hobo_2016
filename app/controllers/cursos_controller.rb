class CursosController < ApplicationController

  hobo_model_controller

  auto_actions :all


  def index
    hobo_index Curso.apply_scopes(
      :search => [params[:search], :titulo],
      :order_by => parse_sort_param(:titulo, :lugar, :fecha)
    )
  end


end
