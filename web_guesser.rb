require 'sinatra'
require 'sinatra/reloader'

randy = rand(100).to_s

get '/' do
	guess = params["guess"].to_i
	msg = getMsg(guess.to_i, randy.to_i)
	erb :index, :locals => {:randy => randy, :msg => msg}
end


def getMsg(guess, randy)
	diff = guess-randy
	puts "diff is " + diff.to_s
	if(diff == 0)
		return msg = guess.to_s + ' is correct'
	elsif(diff > 0)
		if(diff>10)
			return msg = guess.to_s + ' is way too high'
		else
			return msg = guess.to_s + ' is too high'
		end
	elsif(diff<-10)
		return msg = guess.to_s + ' is way too low'
	else
		return msg = guess.to_s + ' is too low'#wrong
	end
	return "REEE"
end