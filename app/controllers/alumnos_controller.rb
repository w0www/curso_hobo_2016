class AlumnosController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  auto_actions_for :curso, :create

end
