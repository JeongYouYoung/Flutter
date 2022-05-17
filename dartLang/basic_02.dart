main(){
  // List라는 Class 추가하겠다.
  // 진짜 많이 쓰임
  List treeKingdoms = [];

  //데이터 추가하기
  treeKingdoms.add("위");
  treeKingdoms.add("촉");
  treeKingdoms.add("오");

  print(treeKingdoms);
  print(treeKingdoms[0]);

  //수정하기
  treeKingdoms[0] = "We";
  print(treeKingdoms);

  //(번지수로)삭제하기 
  //거의 번지수를 알고있어서 이걸 많이 씀
  treeKingdoms.removeAt(1);
  print(treeKingdoms);

  //(데이터값)으로 삭제하기
  treeKingdoms.remove('We');
  print(treeKingdoms);

  //길이 알기
  print(treeKingdoms.length);

  //지금 문자랑 숫자가 들어오고있어 그이유! 타입을 안줘서! -> dynamic
  treeKingdoms.add(1);
  print(treeKingdoms);

  //List 타입 만들어주기
  //(genaric)제너릭 주기 이게 제일 면접에서 많이 물어봄,
  List<String>treeKingdoms2 = [];
  
  //-------------------------------------------
  //Map : Key와 Value로 이루어진 Collction(java:딕셔너리)
  Map fruits = {
    'apple': '사과',
    'grape' : '포도',
    'watermelon' : '수박',
  };
  //키값으로 출력하기
  print(['apple']);
  
  //수정하기
  fruits['watermelon'] = '시원한 수박';

  //추가하기
  //새로운 키와 벨류값 넣어주면 추가!
  fruits['banana'] = '바나나';
  print(fruits);

  //맵도 제너릭이 있음
  //키값String,벨류int
  Map<String, int> fruitsPrice = {
    'apple': 1000,
    'grape' : 2000,
    'watermelon' : 3000,
  };
print(fruitsPrice['apple']);

// A value of type 'int?' => null 수용할수 있는 변수는 !를 달아줌
int applePrice = fruitsPrice['apple']!;

int numA = 10; // <- numA = null; 안들어감
int? numB = 100; // int? <- null 세이퍼티 null값이 들어갈수 있도록 선언.
numB = null; //null 값이 들어감.







}