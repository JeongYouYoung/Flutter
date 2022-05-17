main() {
  //화면 출력
  print("Hellow World!");

  //변수 선언
  String name = "Kim"; //string 라고 선언했으니까 string형만 가능

  //data를 가지고 자기 타입으로 바뀜 형태를 맘대로 바꿀수 없음
  // var는 요즘 안씀 파란줄이 자꾸 생겨서..
  var name1 = "Kim";
  var intNum1 = 1;

  // 여러 형태가 다 들어갈수 있음
  // 개발자들은 잘안씀. 헷깔림
  dynamic name2 = "Lee";

  //정수
  int int1 = 30;
  int int2 = 20;
  
  //바로 실수로 나옴
  print(int1 / int2);
  print(int1 % int2);
  print(int1 ~/ int2);
 
  // 문자열
  String str1 = "유비";
  String str2 = '장비';

  print(str1 + ' : ' + str2);
  
  // 문자열 보간법 : java에는 없음. 요즘언어는 다 이런식으로 씀.
  // ${}
  print("$str1 : $str2");
  print("int1과 int2의 합은 ${int1 + int2} 입니다.");

  //





}
