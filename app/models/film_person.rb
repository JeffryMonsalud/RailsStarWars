class FilmPerson < ApplicationRecord
  belongs_to :people
  belongs_to :films
end
