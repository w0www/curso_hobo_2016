class AlumnosController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :show

  auto_actions_for :cursos, :create

end
