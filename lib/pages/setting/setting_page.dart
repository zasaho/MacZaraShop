import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_interface.dart';
import 'package:get/get.dart';
import 'package:zara_shop/models/education_model.dart';
import 'package:zara_shop/pages/about/about_page.dart';
import 'package:zara_shop/pages/home/home_page.dart';
import 'package:zara_shop/pages/setting/controller/counter_controller.dart';
import 'package:zara_shop/pages/setting/controller/setting_service.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final setting_api = Get.put(SettingService()); //Dependency injection
  //final setting_api = Get.find<SettingService>();
  final controller = Get.put(CounterController());
  String selectedItem = 'Persian';
  late Education selectedEdu;

  List<Education> educationList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    educationList.add(new Education('Diploma', '100'));
    educationList.add(new Education('Fogh Diploma', '101'));
    educationList.add(new Education('Master', '102'));
   // selectedEdu=new Education('Diploma', '100');
    selectedEdu=educationList[0];
  }

  //final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                //Get.to(AboutPage());
                Get.toNamed('about');
              },
              child: Text('About us')),
          Text('${setting_api.value}'),
          Text('${setting_api.getDataFromServer()}'),
          ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: Text('Increment')),
          Obx(() => Text('${controller.count}')),
          ElevatedButton(
              onPressed: () {
                controller.decrement();
              },
              child: Text('Decrement')),
          ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'About App', middleText: 'Zara Shop Co');
              },
              child: Text('Dialog')),
          ElevatedButton(
              onPressed: () {
                Get.snackbar('Message', 'Dont back!',
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: Text('Snackbar')),
          ElevatedButton(
              onPressed: () {
                Get.changeTheme(ThemeData.light());
              },
              child: Text('Theme')),
          ElevatedButton(
              onPressed: () {
                Get.locale = Locale('fa_IR');
              },
              child: Text('Locale')),
          DropdownButton<String>(
              items: <String>['Persian', 'Arabic'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Select Lang:'),
              value: selectedItem,
              onChanged: (value) {
                //   controller.selected=value.toString() as RxString;
                setState(() {
                  selectedItem = value!;
                });
              }),
          DropdownButton<Education>(
              items: educationList.map((Education value) {
                return DropdownMenuItem<Education>(
                  value: value,
                  child: Text(value.title),
                );
              }).toList(),
              hint: Text('Select Level:'),
               value:selectedEdu,
              onChanged: (value) {
                //   controller.selected=value.toString() as RxString;
                setState(() {
                     selectedEdu=value!;
                     print (value.title+ ' and '+value.code);
                });
              })
        ],
      ),
    );
  }
}
