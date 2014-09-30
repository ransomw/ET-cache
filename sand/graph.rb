class UserNode
  def initialize
    @followings = {}
    @followers = {}
  end

  def add_following( username )
    @followings[username] = UserNode.new
  end

  def add_follower( username )
    @followers[username] = UserNode.new
  end

end

class UserGraph
  def initialize
    @root_nodes = {}
  end

  def add_root_node( username )
    @root_nodes[username] = UserNode.new
  end

end
