class Node
    attr_accessor :id, :edges, :cost, :done, :from #from親を格納
    def initialize(id, edges=[], cost=nil, done=false)
      @id, @edges, @cost, @done = id, edges, cost, done
    end
end

class Edge #距離ラベル
    attr_reader :cost, :nid #ゲッター
    def initialize(cost, nid) #nidってなんだ
      @cost, @nid = cost, nid
    end
end

class Graph
    def initialize(data)
      @nodes =
        data.map do |id, edges| #idは場所。key
          edges.map! { |edge| Edge.new(*edge) }
          Node.new(id, edges)
        end
    end

    def cost(nid, sid) #最短距離までにかかる重り
        dijkstra(sid)
        @nodes.find { |node| node.id == nid }.cost		
    end

    def print_route(sid, gid)
        dijkstra(sid) 
        base = @nodes.find { |node| node.id == gid }
        @res = []
        while base = @nodes.find { |node| node.id == base.from }
          @res << base
        end
        @res
        puts @res.reverse.map { |node| "#{node.id}(#{node.cost})" }.join(" -> ")
    end

    private
    def dijkstra(sid)
      @nodes.each do |node| #初期化
        node.cost = node.id == sid ? 0 : nil #スタートのセット
        node.done = false
        node.from = nil
      end

      loop do
        done_node = nil #確定したnode 

        @nodes.each do |node|
          next if node.done or node.cost.nil? #判定するnodeがすでに最短距離だと確定している、またはnilならループを飛ばす
          done_node = node if done_node.nil? or node.cost < done_node.cost #確定したnodeが空または,判定nodeの重みが,確定している重りより小さい
        end
        break unless done_node #nodeが確定したら操作終了
        done_node.done = true
        
        done_node.edges.each do |edge|
          to = @nodes.find{ |node| node.id == edge.nid }
          cost = done_node.cost + edge.cost
          from = done_node.id
          if to.cost.nil? || cost < to.cost
            to.cost = cost 
            to.from = from
          end
        end
      end

    end
end

data = {
 :x => [[1, :a], [9, :b], [4, :c]],
 :a => [[1, :x], [7, :b], [4, :d]],
 :b => [[9, :x], [7, :a], [3, :c], [3, :d],[1,:e]],
 :c => [[4, :x], [3, :b], [2, :f]],
 :d => [[4, :a], [3,:b],[4, :e], [6, :g],[10, :y]],
 :e => [[1,:b],[4,:d],[4,:f],[5,:y]],
 :f => [[2,:c],[4,:f],[8,:y]],
 :g => [[6, :d],[1,:y],[3,:h]],
 :h => [[3, :g],[4,:y]],
 :y => [[4,:h], [8,:f],[5,:e],[10,:d],[1,:g]]
 }

g = Graph.new(data)
g.print_route(:x, :y)

