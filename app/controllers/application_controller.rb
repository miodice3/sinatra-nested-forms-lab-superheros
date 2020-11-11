require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :new
    end

    post '/teams' do

        @team = Team.new(params[:team])
        #binding.pry

        params[:team][:hero].each do |member|
            Member.new(member)
        end

        @member=Member.all

        erb :output

    end


end