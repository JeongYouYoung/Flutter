main(){
  //function들의 집합은 class다
  ThreeKingdoms threeKingdoms = ThreeKingdoms();
  print(threeKingdoms.name);
  threeKingdoms.sayName();

  ThreeKingdoms2 threeKingdoms2 = ThreeKingdoms2('유비','촉');
  threeKingdoms2.saySomething();
} //main

class ThreeKingdoms{
  //Field
  String name = '유비';

  //Constructor

  //Method or Function
  sayName(){
    //this 쓰는거는 내 필드에 있는 변수값, 생성자가 생기면 헷깔려서 써주는게 좋아.
    print("내이름은 ${this.name} 입니다.");
    
  }
}
class ThreeKingdoms2{
  //Field
  //지금은 없으나 데이터값 받을때 대출받는것
  late String name;
  // null 값으로 받는것
  String? nation;



  //Constructor
  ThreeKingdoms2(String name, String nation)
  : this.name = name,
  this.nation = nation;

  //Method
  saySomething(){
    print("제이름은 ${this.name} 이고 조국은 ${this.nation}입니다");
  }
}