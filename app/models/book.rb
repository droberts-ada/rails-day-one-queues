class Book < ApplicationRecord
  validates :title, presence: true, length: { in: 5..25 }
  validates :author, presence: { message: "bad author bad authr"}


  def age
    return nil if publication_year.nil?
    Date.today.year - publication_year
  end
end
