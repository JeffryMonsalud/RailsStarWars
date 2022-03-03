class FilmsController < ApplicationController

  # GET /films or /films.json
  def index
    @films = Film.all
  end

  # GET /films/1 or /films/1.json
  def show
    @film = Film.includes(:people)
  end

  # GET /films/new
  def new
    @film = Film.new
  end

  def self.search(search)
    if search
      film_search = Film.find_by(title: search)
        if film_search
          self.where(id: film_search)
        else
          @film = Film.all
        end
      else
        @film = Film.all
      end
    end
end
