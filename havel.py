print("数列を半角スペースを入れて入力してください")
#splitで半角スペースで入力された値を整数型で配列に格納
data = list(map(int, input().split()))

while True:
    data.sort(reverse=True) #降順
    print(data)
    for i in range(0,data[0]): #0から先頭配列要素-1までループする
        data[i+1]-=1 
        if data[i+1]<0 or len(data) <= data[0]: #配列要素内がゼロ以下または,配列数以上の値が存在している時恥数列ではない.data[i]+1としているのは,一つ上の行でマイナスをしているため.
            print("次数列ではない")
            exit() #結果が出たため,実行を終了
    data[0] = 0 #先頭配列要素にゼロを入れることによって,削除したとして扱う
    print(data)
    if all(elem == 0 for elem in data): #配列要素内すべてがゼロの場合は,次数列である.
        print("次数列である")
        exit() #結果が出たため,実行を終了

       
    
  
