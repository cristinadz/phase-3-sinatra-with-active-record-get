class ApplicationController < Sinatra::Base

  #add this line to set the Content-Type header for all responses 
  set :default_content_type, 'application/json' 

  get '/games' do
    # { message: "Hello world" }.to_json
    # get all games from db
    # return a JSON response with array of all the game data

    games = Game.all
    games.to_json

  end

  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json(include: { reviews: { include: :user} })
  end

end
