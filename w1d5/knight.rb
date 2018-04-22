require_relative "./skeleton/lib/00_tree_node"

class KnightPathFinder

  attr_reader :board
  def initialize(start_pos)
    @board = KnightPathFinder.empty_grid(8)
    @pos = start_pos
    @visited_pos = []
  end

  def self.empty_grid(size)
    Array.new(size){ Array.new(size){ [] } }
  end



  def build_move_tree(end_pos)
    start_pos = PolyTreeNode.new(@pos)
    move_queue = new_move_positions(start_pos.value) #[x,y]
    move_queue.map!{|coord| PolyTreeNode.new(coord)} #nodes storing [x,y]
    move_queue.each {|move| move.parent=start_pos} #set parents for each to original
    until move_queue.empty?
      move = move_queue.shift #PolyTreeNode
      pos = move.value
      return find_path(move) if pos == end_pos #finished!
      next_moves = new_move_positions(pos) #gives coords
      children = next_moves.map{|coord| PolyTreeNode.new(coord)}
      children.each{|child| child.parent=move}
      move_queue.concat(children)
    end
    nil
  end

  def find_path(end_node) #takes PolyTreeNode args
    res = []
    current = end_node
    until current.value == @pos
      res.push(current.value)
      current = end_node.parent
    end
    res
  end

  def valid_moves(pos)
    x,y = pos
    direction = [[1,2],[2,1],[-1,2],[-2,1],[1,-2],[2,-1],[-1,-2],[-2,-1]]
    moves = direction.map{ |path| [path.first + x, path.last + y] }
    moves.select{ |path| on_board?(path)}
  end

  def on_board?(pos)
    pos.all? { |l| l.between?(0,7)}
  end

  def new_move_positions(pos)
    remaining_pos = valid_moves(pos).reject{ |moves| @visited_pos.include?(moves) }
    @visited_pos += remaining_pos
    remaining_pos
  end
end

k = KnightPathFinder.new([2,3])
k.valid_moves([2,3])
k.build_move_tree([2,3])
