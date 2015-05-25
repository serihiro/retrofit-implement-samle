class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  ErrorCode = Struct.new(:klass, :code)
  ERROR_CODES = [
      ErrorCode.new(Exception, ),
      ErrorCode.new(ActionController::RoutingError, :internal_server_error),
      ErrorCode.new(ActiveRecord::RecordNotFound, :not_found)
  ]

  ERROR_CODES.each do |err|
    rescue_from err.klass do |e|
      logger.error [e.message, e.backtrace].flatten.join("\n")
      render_err err.code, [e.message]
    end
  end

  private

  def render_json(resource:, serializer:, ops: nil)
    render_ops = {serializer: serializer, json: resource}
    render_ops.reverse_merge!(meta_hash(success: resource.valid?, error_messages: resource.errors.full_messages))
    render_ops.reverse_merge!(ops) if ops.present?
    render render_ops
  end

  def render_err status, messages = []
    render json: meta_hash(success: false, error_messages: messages), status: status
  end

  def meta_hash(success:, error_messages:)
    {meta: {success: success, error_messages: error_messages}}
  end
end
