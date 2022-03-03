class Film < ApplicationRecord
    has_many :film_people
    has_many :person, through: :film_people
    has_and_belongs_to_many :person

end
