module ControllerConcerns::Todo::Read
  def index
    render json: @todo, root: false, each_serializer: TodoSerializer
  end

  def show
    render json: @todo, root: false, serializer: TodoSerializer
  end
end
