require 'rubygems'
require 'sinatra'
require 'podio'
require 'json'

get '/' do
  content_type :json
  Podio.client = Podio::Client.new({:api_key => 'inboxcounter', :api_secret => 'DpveglhC8ZzxiqPjOXGJd150PRBGAv5UEKeoLcdMUp9oocNOxc8VGTHmrVnkVAh6'})
  Podio.client.authenticate_with_credentials(params['u'], params['p'])


  user = Podio::UserStatus.current  
  puts "#{user.inbox_new}"

  { :item => user.inbox_new, :max => { :text => 'max inbox', :value => "30" }, :min => { :text => 'min inbox', :value => "0" } }.to_json




end

