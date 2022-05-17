main(){
  //Funcion (java : Method) : 코드들의 집합.
  List<int> list1 = [1,3,5,7,9];
  int sum = 0;
  for(int i in list1){
    sum += i;
  }
  print("합계 : $sum");

List<int> list2 = [10,30,50,70,90]; 
int sum1 = 0;
  for(int i in list2){
    sum1 += i;
  }
  print("합계 : $sum1");


// Funtion 만들기
// ... 이렇게 숫자가 계속 늘어나 이런건 함수로 만들어 놓으면 좋잖아!
// _ <- 프라이빗 , 안쓰면 퍼블릭
//(리스트 타입이야~)
addList(List list){
int sum = 0;
  for(int i in list){
    sum += i;
  }
  print("합계 : $sum");
}
// Funtion 사용하기
  addList(list1);
  addList(list2);

//------------------------------------------
 // 출력은 내가 하겠다! 
int addList2(List list){
int sum = 0;
  for(int i in list){
    sum += i;
  }
  return sum;
}
//출력하기 
int result = addList2(list1);
print(result);

}