import 'dart:io';
void main () {
  Testglob();
}
void Testglob ()  async {
task1();
 String ana = await task2();
task3( ana );

}
void task1() {
  print('task1 is completed !! ');
}
Future<String> task2()  async  {
   sleep(Duration(seconds: 3));
  print('task2 is completed !! ');
  String result = 'anat9il'; // this is future output
  return  result ;

}void task3(String task2data) {
  print('task3 is completed !! $task2data');
}