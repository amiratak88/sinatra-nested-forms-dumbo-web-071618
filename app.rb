require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do

      @pirate = Pirate.new({
        name: params["pirate"]["name"],
        weight: params["pirate"]["weight"],
        height: params["pirate"]["height"]
      })
      
      @ships = params["pirate"]["ships"].map do |ship_hash|
        Ship.new(ship_hash)
      end
      erb :'pirates/show'
    end

  end
end