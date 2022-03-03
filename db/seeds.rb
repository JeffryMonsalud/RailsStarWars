FilmPerson.delete_all
People.delete_all
Film.delete_all

films = RestClient.get 'https://swapi.dev/api/films/'
filmsJson = JSON.parse films
filmsJson["results"].each do | film | 
    Film.create(
        title: "#{film['title']}",
        episode_id: "#{film['episode_id']}",
        opening_crawl: "#{film['opening_crawl']}",
        director: "#{film['director']}",
        producer: "#{film['producer']}",
        release_date: "#{film['release_date']}",
        url: "#{film['url']}"
    )
end

persons = RestClient.get 'https://swapi.dev/api/people/'
personJson = JSON.parse persons
personJson["results"].each do | person |
    personInfo = Person.create(
        name: "#{person['name']}",
        height: "#{person['height']}",
        mass: "#{person['mass']}",
        hair_color: "#{person['hair_color']}",
        skin_color: "#{person['skin_color']}",
        eye_color: "#{person['eye_color']}",
        gender: "#{person['gender']}"
    )

    # Link the characters to their films
    person['films'].each do | film | 
        filmLink = RestClient.get film
        linkJson = JSON.parse filmLink
        filmName = Film.find_by(title: linkJson['title'])
        FilmPerson.create(
            film: filmName,
            person: personInfo 
        )
    end
end

puts "Created #{People.count} people"
puts "Created #{Film.count} films"
puts "Created #{FilmPerson.count} references"

    
