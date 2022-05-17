main(){
  //비동기처리(java는 어려워.. 안해봄.. 반면 dart는 쉽다.) : A.B.C가 한꺼번에 일하는것
  //동기처리 방식 : A.B.C가 차례로 일하는것
  //동기 처리방식 과 비동기 처리방식

  checkVersion();
  print("End pricess");
  }

// 비동기 함수 끝이네? => 'Future' 'async' 'await' 이셋이 셋트
//async : 일을 동시에 실행 시킴(데이터 퍼포먼스를 높이는 기능 /R은 없음 /파이썬은 있음)
//await : lookupVersion() 이 실행이 되어 있으나 같이 실행된 다른애들이 끝날때가지 기다려라 라는 뜻.
Future checkVersion() async{
  var version = await lookupVersion();
  print(version);

  }
int lookupVersion(){
  return 12;
  
}