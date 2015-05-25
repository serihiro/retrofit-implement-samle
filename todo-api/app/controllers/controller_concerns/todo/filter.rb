module ControllerConcerns::Todo::Filter
  extend ActiveSupport::Concern

  included do
    before_action :initialize_todos, except: [:create]

    def initialize_todos
      @todo = params[:id].present? ? ::Todo.find(params[:id]) : ::Todo.all
    end
  end
end
