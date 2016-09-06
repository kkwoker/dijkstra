require 'spec_helper'

describe Graph do
  M = Float::INFINITY
  let(:nodes) { [:a, :b, :c, :d, :e, :f] }

  let(:edges) do
    [
      [  0,   3, nil, nil, nil, nil],
      [  3,   0,   6,   1, nil, nil],
      [nil,   6,   0, nil,   2, nil],
      [nil,   1, nil,   0,   5,   5],
      [nil, nil,   2,   5,   0,   4],
      [nil, nil, nil,   5,   4,   0]
    ]
  end

  let(:graph) do
    Graph.new(nodes, edges)
  end
  describe '#neighbors_of' do
    xit "returns the node's neighbors" do
      puts graph.inspect
      expect(graph.neighbors_of(:a)).to eq [:b]
    end
    xit "returns the node's neighbors" do
      expect(graph.neighbors_of(:b)).to eq [:a, :c, :d]
    end
  end
  describe '#initial_distances' do
    specify do
      distances = graph.send(:initial_distances, :a)
      expect(distances).to eq [0, M, M, M, M, M]
    end
    specify do
      distances = graph.send(:initial_distances, :b)
      expect(distances).to eq [M, 0, M, M, M, M]
    end
  end

  describe '#closest' do
    xit 'returns the closest node' do
      nodes = [:b, :c, :d, :e, :f]
      distances = [M, M, 1, M, M, M]
      node = graph.send(:closest, nodes, distances)
      expect(node).to eq :c
    end
    xit 'returns the closest node' do
      distances = [ 10, 1, 4, M, M, M]
      node = graph.send(:closest, distances)
      expect(node).to eq :b
    end

  end
  describe '#solve_from' do
    it 'returns an array of shortest distances to each node' do
      expect(graph.solve_from(:a)).to eq [ 0, 3, 9, 4, 9, 9 ]
    end
  end

end

