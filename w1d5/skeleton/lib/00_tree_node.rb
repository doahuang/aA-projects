require "byebug"
class PolyTreeNode

  attr_accessor :children, :parent
  attr_reader :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    old_parent = @parent
    @parent = new_parent
    return if old_parent == @parent || new_parent.nil?
    new_parent.add_child(self)
    old_parent.children.reject!{ |child| child == self } if old_parent
  end

  def add_child(target)
    @children.push(target) if !@children.include?(target)
    target.parent = self
  end

  def remove_child(target)
    raise 'target not node' unless @children.include?(target)
    @children.reject!{|child| child == target}
    target.parent = nil
  end

  def dfs(target_value)
    return self if @value == target_value
    @children.each do |child|
      found = child.dfs(target_value)
      return found if found
    end
    nil
  end

  def bfs(target_value)
    queue_to_search = [self]
    until queue_to_search.empty?
      curr_check = queue_to_search.shift
      return curr_check if curr_check.value == target_value
      queue_to_search += curr_check.children
    end

  end


  # def ==(other_node)
  #   self.class == other_node.class &&
  #   self.value == other_node.value &&
  #   self.children == other_node.children
  # end

  def inspect
    {
      'value' => value,
      'parent' => parent.value,
      'children' => children.map{ |child| child.value }
    }.inspect
  end
end

a = PolyTreeNode.new("A")
b = PolyTreeNode.new("B")
c = PolyTreeNode.new("C")
