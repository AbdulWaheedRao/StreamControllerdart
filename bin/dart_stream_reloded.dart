import 'dart:async';

StreamController<int> controller=StreamController<int>();
StreamSink sink=controller.sink;
Stream<int> stream=controller.stream;

void main(List<String> arguments) {
//var stream=generateNo(500).listen((event) {print(event);
//});

var stream=generateNo(500);
sumStream(stream).then((value) => print('sum of stream is:$value'));

}
Stream<int> generateNo(int maxValue) async*{
for (var i = 1; i < maxValue; i++) {
  yield i;
 await Future.delayed(const Duration(seconds: 2));
}
}
Future<int> sumStream(Stream<int> stream) async{
  int sum=0;
 await for(final value in stream){
    sum+=value;
  }
  return sum;

}