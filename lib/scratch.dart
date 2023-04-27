import 'dart:io';

void main() {
  processes();
}

processes() async {
  process1();
  String? res = await process2();
  process3(res);
}

process1() {
  print("this is 1111111111111");
}

Future<String?> process2() async {
  Duration duration = Duration(seconds: 5);
  String? result;
  await Future.delayed(duration, () {
    result = "22222222222222222222222222";
    print(result);
  });
  return result;
}

process3(String? two) {
  print("this is $two");
}
