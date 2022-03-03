class Film < ApplicationRecord
    has_many :film_people
    has_many :people, through: :film_people
    has_and_belongs_to_many :people

end
