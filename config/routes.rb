Rails.application.routes.draw do
  get 'slack_responses_controller/index'

  get 'slack_response_controller/index'

  resources :users
  scope '/slack_responses' do
    get '/' => 'slack_responses#index'
    post '/' => 'slack_responses#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
