print "数列を半角スペースを入れて入力してください>"
a=gets.chomp 
array = a.split.map(&:to_i) #受け取った値をsplitで区切って、配列に整数型として格納する
array.sort!.reverse! #配列を降順にする
puts array.join(' ') #配列内の要素を,半角スペースを入れて結合して出力する
while true
    for i in 0..(array[0]-1) #0から添字が0の配列要素-1の値まで繰り返し処理をする
        array[i+1]-=1 #添字プラス1の配列要素を-1する
        if array[i+1]<0 || array.length <= array[0] #マイナス1をした値が負の数,または,iの配列要素+1が配列要素数以上の場合は次数列ではない
            puts("次数列ではない")
            exit #結果が出たので,exitをして実行を終了する
        end
    end
    array.shift() #配列の先頭要素を削除する
    array.sort!.reverse! #配列を降順にする
    puts array.join(' ') #配列の現状を出力
    if array.all? {|w| w==0 } #配列内の要素すべてがゼロなら次数列である
       puts("次数列である")
       exit #結果が出たので,exitをして実行を終了する
    end
end