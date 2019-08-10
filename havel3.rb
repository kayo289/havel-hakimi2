def des_sort(array)
  array = array.sort!.reverse!
end

#ハベルハキミを続けるかの判定
def juge_loop(array)
  have_zero=array.all? {|w| w==0 } #配列要素全てが0かどうかを判定
  have_minus=array.any? {|w| w < 0 } #配列要素内に一つでもマイナスがあるかどうかを判定
  more_n = array.any? {|w| w>=array.length } #
  have_zero || have_minus || more_n ? false : true  #上記の条件に一つでも当てはまれば,ループをしないfalseを返す
end

def calc_result(array)
  #havel-hakimiの操作を行なった上で、その数列がhavel-hakimiだったらカウントを増やす
  unless array.any? {|w| w<0 } || array.any? {|w| w>=array.length }
    $cnt+=1
  end
end

#ハベルハキミの動作をする
def havel(array,n)
  for i in 1..n
    array[i]=array[i]-1
  end
  array[0]=0 #0を代入して,削除した事にした.
  des_sort(array) #削除した後に,降順に並びかえた。
end


#ランダムな数列を生成する.列数以上の値を数列に含めるかを決めるmoreを引数として受け取っている
def init_array(array,n,more)
  for i in 0..n-1
    #more引数によって、列数以上の値を含むか含まない数列を作成している
    if n >= 10
      array[i] = rand(0..9)
    else
      array[i] = more ? rand(0..9) : rand(0..n-1)
    end
  end
end


puts "実験する回数を入力してください"
k=gets.chomp.to_i
puts "2からいくつまでの列数を調査しますか"
b=gets.chomp.to_i
puts "列数以上の値を数列に含めますか？(true:1,false:0)"
a=gets.chomp.to_i
juge = a==1 ? true : false #1を入力したらtrueを,ちがければfalseを代入する

for a in 2..b
  array=[]
  init_array(array,b,juge) #データの初期化
  $cnt=0.0
  des_sort(array)

  for i in 0..k-1
    while juge_loop(array)
      havel(array,array[0])
    end
    calc_result(array)
    init_array(array,b,juge) 
  end

  puts "列数#{a}の数列が次数列である確率は#{($cnt/k)*100}%である\n"
  $cnt=0.0 #次数列であるかをカウント変数を初期化
end



