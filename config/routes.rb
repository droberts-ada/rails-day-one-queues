Rails.application.routes.draw do
  root 'welcome#index', as: 'welcome'

  get 'books', to: 'books#index', as: 'books'
  get 'books/new', to: 'books#new', as: 'new_book'

  get 'books/:id', to: 'books#show', as: 'book'

end
