#配列を降順にする
def des_sort(array)
    array = array.sort!.reverse!
end
 
#配列内にある要素を,半角スペースを入れて結合して出力
def print_data(array)
    puts array.join(' ')
end

#ハベルハキミを続けるかの判定
def juge_loop(array)
    have_zero=array.all? {|w| w==0 } #配列要素全てが0かどうかを判定
    have_minus=array.any? {|w| w < 0 } #配列要素内に一つでもマイナスがあるかどうかを判定
    num=array.any? {|w| w>=array.length } #配列要素内に一つでも,数列の列数を超える数が入っているかを判定
    have_zero || have_minus ? false : true  #上記の条件に一つでも当てはまれば,ループをしないfalseを返す
end

#ハベルハキミの処理をした後に,配列内にマイナスがある。または、配列要素数を超える数があれば次数列ではない
def print_result(array)
  puts array.any? {|w| w<0 } || array.any? {|w| w>=array.length } ? "次数列ではない" : "次数列である"
end

#ハベルハキミの動作をする
def havel(array,n)
  for i in 1..n
    array[i]-=1
  end
  array[0]=0 #0を代入して,削除した事にした.
  des_sort(array) #削除した後に,降順
end

puts "数列を入力してください"
a=gets.chomp
#splitで区切って整数型に変換してから、配列内に格納
array = a.split.map(&:to_i) 

des_sort(array)
print_data(array)
if array[0]>=array.length
  puts "次数列ではない"
end

#ハベルハキミの動作を繰り返す
while juge_loop(array)
    havel(array,array[0]) 
    print_data(array) #途中過程を出力する
end
print_result(array) #結果を出力

