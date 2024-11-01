import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  increment()=> count++;
  decrement()=> count--;
  var selected="".obs;
}
