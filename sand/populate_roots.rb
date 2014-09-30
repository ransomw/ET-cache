require 'twitter'
require './config'
require './graph'

require 'pry'

CLIENT = Twitter::REST::Client.new(CONFIG)

ROOT_USERS = ["ransomwilliams"]

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

root_node = populate_root_node("ransomwilliams")

binding.pry
