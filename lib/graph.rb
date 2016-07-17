class Graph
  attr_accessor :edges, :nodes
  M = Float::INFINITY
  def initialize(nodes, edges)
    @edges = edges
    @nodes = nodes
  end

  def solve(source)
    costs = initial_distances(source)
    unvisited = nodes
    until unvisited.empty?
      current_node = unvisited.min_by {|node| costs[nodes.index(node)]}
      unvisited -= [ current_node ]
      edges[nodes.index(current_node)].each_with_index do |value, i|
        next unless value
        new_cost = value + costs[nodes.index(current_node)]
        costs[i] = new_cost if new_cost < costs[i]
      end
    end
    costs
  end
  private

  def initial_distances(source)
    a = [M] * nodes.length
    a[nodes.index(source)] = 0
    a
  end
end
