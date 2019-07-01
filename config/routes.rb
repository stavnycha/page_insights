Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :page_insights, only: [:create, :index], path: :tests do
        get :last, on: :collection
      end
    end
  end

  get '*unmatched_route', to: 'application#render_not_found'
  post '*unmatched_route', to: 'application#render_not_found'
end
