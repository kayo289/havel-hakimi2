#include<stdio.h>
#include<string.h>


void print_result(int n);/*配列を出力する関数*/
void des_sort(int array[],int N);/*配列を降順にする関数*/
void havel(int array[],int N);/*havel-hakimiの動作を行う関数*/
int have_minus(int array[],int N);/*最後の出力結果を決めるジャッジを行う*/
int juge_loop(int array[],int N);/*havel-hakimi自体をループで行うかどうかを判定する関数*/
   
int main(){
   int N;
   printf("列数を入力してください");
   scanf("%d",&N);
   
   int array[N];
   printf("数列を入力してください\n");
   for(int i = 0;i < N;i++)
      scanf("%d",&array[i]);
   
   des_sort(array,N);/*配列を降順*/
   /*配列の中に,負の数と0が無い時に繰り返す*/
   while(juge_loop(array,N))
      havel(array,N);
   print_result(have_minus(array,N));
   return 0;
}
/*配列を出力する関数*/
void print_data(int array[],int N){
   for(int i=0;i<N;i++)
      printf("%d",array[i]);
   printf("\n");
}

int juge_loop(int array[],int N){
   int cnt=0;
   for(int i=0;i<N;i++)/*負の数か、すべての要素が0の時,0を返す */
       if(array[i]<0 || (array[0]==0&&array[1]==0)) return 0;
   return 1;
}

void havel(int array[],int N){
   print_data(array,N);/*現状を出力する*/
   /*添字が0の配列要素の数だけ、次の配列をそれぞれ1を引く*/
   for(int i = 1;i <= array[0];i++)
      array[i]--;
   array[0]=0;/*添字が0の配列に0を上書きする*/
   des_sort(array,N);/*配列を降順にする*/
}

void print_result(int n){
   if(n) printf("次数列である\n");
   else printf("次数列ではない\n");
}

void des_sort(int array[],int N){
  int i,j,tmp;
  for (i=0; i<N; i++) {
     for (j=i+1; j<N; j++) {
      if (array[i] < array[j]) {
         /*隣あう配列要素で,右のほうが小さければ入れ替える*/
        tmp =  array[i];
        array[i] = array[j];
        array[j] = tmp;
      }
    }
  }
}

/*配列中の要素にマイナスがあるかを判定*/
int have_minus(int array[],int N){
   for(int i=0;i<N;i++)
      if(array[i]<0) return 0;
   return 1;
}
