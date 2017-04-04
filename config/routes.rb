Rails.application.routes.draw do
  root 'welcome#index', as: 'welcome'

  resources :books   # , only: [:index, :show]
  # get 'books', to: 'books#index', as: 'books'
  # get 'books/new', to: 'books#new', as: 'new_book'
  # post 'books', to: 'books#create'
  #
  # get 'books/:id', to: 'books#show', as: 'book'
  # get 'books/:id/edit', to: 'books#edit', as: 'edit_book'
  # patch 'books/:id', to: 'books#update'
  # delete 'books/:id', to: 'books#destroy'

  post 'books/:id/mark_read', to: 'books#mark_read', as: 'mark_book_read'

end
