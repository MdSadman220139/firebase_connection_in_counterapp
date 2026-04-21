import 'package:get/get.dart';

class CounterController extends GetxController {
  int _count = 0;
  int get count => _count; //encapsulate kora hoyse

  void increment() {
    _count++;
    update();
  }

  void decrement() {
    _count--;
    update();
  }
}
