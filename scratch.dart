import 'dart:io';

void main(){
  runtasks();
}

void runtasks() async{
  task1();
 String task2d = await task2();
  //task3(task2d);
}

void task1(){
  String res = 'Hell Yeah!x1';
  print('Task1 is completed!');
}

Future<String> task2() async{

  Duration threeseconds = Duration(seconds: 3);

  String res = '0';

 await Future.delayed(threeseconds, (){
    res = 'Hell Yeah!x2';
    print('Task2 is completed!');
  });
 return res;
}

void task3(String task){
  String res = 'Hell Yeah!x3';
  print('Task3 is completed! $task');
}