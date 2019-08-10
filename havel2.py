print("数列を入力してください")
data = list(map(int, input().split()))
#負の数が入っていないまたは,配列要素が全てゼロではない間はループし続ける
while True:
    data.sort(reverse=True)
    print(data)
    for i in range(0,data[0]):
        data[i+1]-=1 
        if data[i+1]<0 or len(data)<=data[0]:
            print("次数列ではない")
            exit()#結果が出たため,実行を終了
    del data[0] #先頭配列を削除
    print(data)
    if all(elem == 0 for elem in data): #配列要素全てがゼロである
        print("次数列である")
        exit()

       
    
  