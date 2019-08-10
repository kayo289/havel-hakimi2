puts "0~9までの点があります。どこからどこまでの点の最短距離を求めますか？"
s_id=0
e_id = 9

@u = []
@u << s_id
@l = [] #スタート地点から距離は見つかっているが、最短路が確定していない頂点集合
data = [
  [0,1,9,4,-1,-1,-1,-1,-1,-1],
  [1,0,7,-1,4,-1,-1,-1,-1,-1],
  [9,7,0,3,3,1,-1,-1,-1,-1],
  [4,-1,3,0,-1,-1,2,-1,-1,-1],
  [0,4,3,-1,0,4,-1,6,-1,10],
  [-1,-1,1,-1,4,0,4,-1,-1,5],
  [-1,-1,-1,2,-1,4,0,-1,-1,8],
  [-1,-1,-1,-1,6,-1,-1,0,3,1],
  [-1,-1,-1,-1,-1,-1,-1,3,0,4],
  [-1,-1,-1,-1,10,5,8,1,4,0]
]
p=[] #親ラベル保存
node=[] #距離ラベル格納
node1=[]
for i in 0..data.length-1
  node << [nil] #無限を-1とする 添字0が点の位置名、1が距離ラベル
  node1 << i
  p << -1
end

#初期化
for i in 0..node.length-1
   node[i] = 0 if i==s_id 
end

while !(@l.any?{|l| l==e_id}) #最後の点も探索すれば終了]
    @stand = node1.find{|w| node[w]!=nil }#どの点を最小値の点として保存するかを決めた

    (node1-@u).each do |n|
       @stand = n if (node[@stand] > node[n]) && node[i] != nil
    end
  
    for i in 0..(data[@stand].length-1)
        next if data[@stand][i] == -1 #隣接指定なければ処理を飛ばす
        @l << i
        if node[i] == nil || node[i] > data[@stand][i] + node[@stand]
            node[i] = data[@stand][i] + node[@stand]#距離ラベル更新
            p[i] = @stand #現在の基準点、つまり親を格納する
        end
    end

    #lから距離ラベルの最小点を求める
    min=node[@l[0]] #最小を求めるために初期値を代入
    tmp=@l[0]
    @l.each do |l|
        if node[l] < min
            min = node[l]
            tmp = l
        end
    end
    @l-=[tmp] 
    @u<<tmp
end

@res=[] #最後の出力するための配列
@s=end_i
while true
  for i in 0..p.length-1
    break if p[i] == s_id #最後の点まで検査すればwhile文を終了させる
    if p[i] == @s
      @res << i
      @s = i
    end
  end
end

puts @res.reverse.map { |node| "#{node}" }.join(" -> ") 