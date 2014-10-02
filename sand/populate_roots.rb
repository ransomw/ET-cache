require 'twitter'
require './config'
require './graph'

require 'pry'

CLIENT = Twitter::REST::Client.new(CONFIG)

ROOT_USERS = ["ransomwilliams", "swannodette"]

$root_nodes = {}

def populate_root_node( username )
  node = UserNode.new

  followings = CLIENT.following(username)
  followings.to_set.each do |following|
    node.add_following(following.screen_name);
  end

  followers = CLIENT.followers(username)
  followers.to_set.each do |follower|
    node.add_follower(follower.screen_name);
  end

  node
end

# root_nodes = []
# ROOT_USERS.each do |root_user|
#   root_nodes += [populate_root_node(root_user)]
# end

begin
  root_node = populate_root_node("ransomwilliams")
rescue Twitter::Error::TooManyRequests
  print "too many requests populating root node"
  #root node is nil
end

binding.pry
