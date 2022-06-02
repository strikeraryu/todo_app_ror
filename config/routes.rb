Rails.application.routes.draw do
  resources :todo_lists do
     resources :todo_items do
      member do
       patch :complete
      end
    end
  end
  root "todo_lists#index"
  delete 'todo_lists/:id/delete' => 'todo_lists#destroy', as: 'todo_lists_delete'
  get '/todo_lists/:id/delete' => 'todo_lists#destroy'
  delete 'todo_lists/:todo_list_id/todo_items/:id/delete' => 'todo_items#destroy', as: 'todo_items_delete'
  get '/todo_lists/:todo_list_id/todo_items/:id/delete' => 'todo_items#destroy'
  patch 'todo_lists/:todo_list_id/todo_items/:id/complete' => 'todo_items#complete', as: 'todo_items_complete'
  get '/todo_lists/:todo_list_id/todo_items/:id/complete' => 'todo_items#complete'
  end