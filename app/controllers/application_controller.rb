class ApplicationController < ActionController::API
  rescue_from StandardError, with: :render_exception

  def render_exception
    render json: { errors: [t('errors.exception')] }, status: 500
  end

  def render_not_found
    render json: { errors: [t('errors.not_found')] }, status: 404
  end

  protected

  def t(key)
    I18n.t(key)
  end
end
