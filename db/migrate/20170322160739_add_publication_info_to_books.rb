class AddPublicationInfoToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :publication_year, :integer
    add_column :books, :publication_city, :string
  end
end
