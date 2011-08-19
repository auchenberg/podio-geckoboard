require 'rubygems'
require 'sinatra'
require 'podio'

get '/' do
  Podio.client = Podio::Client.new({:api_key => 'inboxcounter', :api_secret => 'DpveglhC8ZzxiqPjOXGJd150PRBGAv5UEKeoLcdMUp9oocNOxc8VGTHmrVnkVAh6'})
  Podio.client.authenticate_with_credentials(params['user'], params['user'])
  
  user = Podio::UserStatus.current
  inbox_count = user.inbox_new
  
  "#{user.inbox_new}"
end

