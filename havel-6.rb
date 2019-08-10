print "数列を半角スペースを入れて入力してください\n"
a=gets.chomp 
array = a.split.map(&:to_i) #受け取った値をsplitで区切って、配列に整数型として格納する
array.sort!.reverse! #配列を降順にする

for k in 1..array.length-1
  sum = 0
  m=0
  for i in 1..k
    sum+=array[i-1] #i-1としているのは添字は0スタートなため
  end
  for i in k+1..array.length-1
    m+= k > array[i] ? array[i] : k #値が小さい法を代入する
  end
  if !(sum <= k*(k-1) + m) || array.any? {|w| w>=array.length } 
    puts "次数列ではない"
    exit
  end
end
puts "次数列である"

