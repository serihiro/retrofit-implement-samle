module ControllerConcerns::Todo::Edit
  def update
    @todo.update permit_todo
    @todo.reload
    render_json(resource: @todo, serializer: TodoSerializer)
  end

  def create
    todo = ::Todo.create permit_todo
    render_json(resource: todo, serializer: TodoSerializer)
  end

  def destroy
    @todo.destroy!
    render json: meta_hash(success: true, messsages: [])
  end

  private

  def permit_todo
    params.permit(:todo, :done)
  end
end
