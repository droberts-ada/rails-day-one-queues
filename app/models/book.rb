class Book < ApplicationRecord
  belongs_to :author
  # validates :title, presence: true, uniqueness: true

  def age
    return nil if publication_year.nil?
    Date.today.year - publication_year
  end
end
