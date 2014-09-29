require 'twitter'
require './config'

# CONFIG = {
#   :consumer_key    => "",
#   :consumer_secret => "",
# }

require 'pry'

client = Twitter::REST::Client.new(CONFIG)

print "initialized client, getting user info\n"

user_info = client.user("ransomwilliams")

print "user info:\n"
print user_info
print "\n"

binding.pry

