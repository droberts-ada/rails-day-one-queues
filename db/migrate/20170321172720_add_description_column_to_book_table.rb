class AddDescriptionColumnToBookTable < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :synopsis, :string
  end
end
