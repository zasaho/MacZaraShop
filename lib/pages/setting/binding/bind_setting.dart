import 'package:get/get.dart';
import 'package:zara_shop/pages/setting/controller/counter_controller.dart';
import 'package:zara_shop/pages/setting/controller/setting_service.dart';

class BindSetting extends Bindings{
  @override
  void dependencies() {
    Get.put(SettingService());
    Get.put(CounterController());
  }
}