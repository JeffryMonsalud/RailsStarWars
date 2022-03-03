class Person < ApplicationRecord
    has_many :film_people
    has_many :films, through: :film_people
end
