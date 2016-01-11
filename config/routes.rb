Rails.application.routes.draw do
  root 'application#index'
  post 'registration' => 'application#registration'
  post 'quiz' => 'application#quiz'
end
