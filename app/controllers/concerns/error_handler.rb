module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |error|
      render_error(message: error.message, status: :not_found)
    end

    def render_error(message: nil, status: :unprocessable_entity)
      render partial: 'shared/error', locals: { message: message}, status: status
    end
  end
end