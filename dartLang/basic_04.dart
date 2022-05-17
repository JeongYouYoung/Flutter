main(){
// ? 가 중요
int? num1 = null;
print(num1);

//null이면(??) 골뱅이! null이 아니면 페이지 보여주고
num1 ??=8;
print(num1);

//삼항 연산자(R은 ifelse)
bool isPublic = true;
var visibility = isPublic ? 'public' : 'private';
print(visibility);


// for 문(java식)
int sum = 0;
for(int i=1; i <= 10; i++){
  sum+=i;
}
print(sum);

// for 문(dart식)
sum=0;
List<int> numList = [1,2,5,6,8];
for(int i in numList){
  sum+=i;
}
print(sum);

}