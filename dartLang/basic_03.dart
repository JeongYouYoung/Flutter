main(){
  //final과 const 의 차이
  final String name1 = '유비'; 
  //name1 = '조조';// <- 데이터 변경이 안됨.
  const String name2 ='관우';
  //name2 = '조조';// <- 데이터 변경이 안됨.

  //시간은 계속변하는데 이상하네
  //(컴파일)실행할때 만들어지는 변수.
  final DateTime now1 = DateTime.now();
  print(now1);

  
  //못바꾸는 값
  //const 는 코딩할때부터 정해진값으로 작동하므로
  //DateTime.now() 로 사용할수 없음.
  //const DateTime now2 = DateTime.now();
}