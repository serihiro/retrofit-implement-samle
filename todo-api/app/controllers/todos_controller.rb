class TodosController < ApplicationController
  include ControllerConcerns::Todo::Filter
  include ControllerConcerns::Todo::Edit
  include ControllerConcerns::Todo::Read
end
