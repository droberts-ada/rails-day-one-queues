class Book < ApplicationRecord
  def age
    return nil if publication_year.nil?
    Date.today.year - publication_year
  end
end
