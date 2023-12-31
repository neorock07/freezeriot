import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezeriot/Activity/Partials/CardIndikator.dart';
import 'package:freezeriot/Activity/Partials/cardCircle.dart';
import 'package:freezeriot/Controller/MqttController.dart';
import 'package:freezeriot/Controller/SelectModelController.dart';
import 'package:freezeriot/Model/ModeModel.dart';
import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var mqttController = MqttController();
  var itemMode = <ModeModel>[
    ModeModel(id: 1, label: "Normal"),
    ModeModel(id: 2, label: "Hemat"),
    ModeModel(id: 3, label: "Pencairan")
  ];

  /*
    PANGGIL CONTROLLER MODE 
   */
  var modeController = SelectModeController();
  var count = 5.obs;
  //  var count;

  @override
  void initState() {
    super.initState();
    mqttController.connect();
    // count = int.parse(mqttController.payloadMsg.value.split(",")[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 24, 26, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
            ),
            /*
            BAGIAN UNTUK TAMPILIN NAMA USER
            */
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  "",
                  style: TextStyle(
                      fontFamily: "Inria",
                      color: Colors.white,
                      fontSize: 25.sp),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            /*
              BAGIAN UNTUK BUAT CARD INDIKATOR
            */

            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(16, 27, 43, 1),
                    borderRadius: BorderRadius.circular(10.h)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Indikator",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Inria",
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        /*
                          WIDGET CardIndikator di path /Partials/CardIndikator.dart
                          BAGIAN CARD INDIKATOR SUHU FREEZER 
                        */

                        Obx(() => (mqttController.payloadMsg.value
                                    .split(",")
                                    .length >=
                                4)
                            ? CardIndikator(context,
                                width: 150.w,
                                height: 50.h,
                                icon: Icons.thermostat,
                                iconColor: Colors.orange,
                                label: "Suhu Freezer",
                                value:
                                   (mqttController.payloadMsg.value.split(",").length == 5)? "${mqttController.payloadMsg.value.split(",")[4]} *C": "${mqttController.payloadMsg.value.split(",")[0]} *C")
                            : const CircularProgressIndicator()),
                        /*
                          WIDGET CardIndikator di path /Partials/CardIndikator.dart
                          BAGIAN CARD INDIKATOR SUHU LINGKUNGAN 
                        */

                        Obx(() => (mqttController.payloadMsg.value
                                    .split(",")
                                    .length >= 4)
                            ? CardIndikator(context,
                                width: 150.w,
                                height: 50.h,
                                icon: Icons.waves,
                                value:
                                    "${mqttController.payloadMsg.value.split(",")[1]} *C",
                                label: "Suhu Lingkungan",
                                iconColor: Colors.deepOrange)
                            : const CircularProgressIndicator()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        /*
                          WIDGET CardIndikator di path /Partials/CardIndikator.dart
                          BAGIAN CARD INDIKATOR SPEED KIPAS 
                        */

                        Obx(() => (mqttController.payloadMsg.value
                                    .split(",")
                                    .length >=
                                4)
                            ? CardIndikator(context,
                                width: 150.w,
                                height: 50.h,
                                value:
                                    "${mqttController.payloadMsg.value.split(",")[2]} RPM",
                                label: "Speed Kipas",
                                icon: Icons.wind_power,
                                iconColor: Colors.blue)
                            : const CircularProgressIndicator()),

                        /*
                          WIDGET CardIndikator di path /Partials/CardIndikator.dart
                          BAGIAN CARD INDIKATOR DAYA 
                        */
                        Obx(() => (mqttController.payloadMsg.value
                                    .split(",")
                                    .length >=
                                4)
                            ? CardIndikator(context,
                                width: 150.w,
                                height: 50.h,
                                label: "Daya",
                                value:
                                    "${mqttController.payloadMsg.value.split(",")[3]} watt",
                                icon: Icons.energy_savings_leaf,
                                iconColor: Colors.green)
                            : const CircularProgressIndicator()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(16, 27, 43, 1),
                  borderRadius: BorderRadius.circular(10.h)),
              child: Obx(() => Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      spacing: 8.dm,
                      children: itemMode
                          .map(
                            (e) => ChoiceChip(
                              selectedColor: const Color.fromRGBO(81, 27, 124, 1),
                              backgroundColor: const Color.fromRGBO(103, 103, 103, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.dm),
                                  side: BorderSide(
                                      color: (modeController.isSelect.value ==
                                              e.id)
                                          ? const Color.fromRGBO(153, 51, 230, 1)
                                          : Colors.white,
                                      width: 5.dm)),
                              label: Text(
                                "${e.label}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Inria",
                                    fontWeight: FontWeight.bold),
                              ),
                              selected: modeController.isSelect.value == e.id,
                              onSelected: (_) {
                                modeController.isSelect.value = e.id!;
                                debugPrint("Selected: ${e.id}");
                                if (e.id == 3) {
                                  // count += 1;
                                  var f = mqttController.payloadMsg.value
                                      .split(',');
                                  mqttController.publish(
                                      "ganyang/cukong/sialan/data",
                                      "${count},${f[1]},${f[2]},${f[3]}");
                                }
                              },
                            ),
                          )
                          .toList(),
                    ),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardCircle(context,
                        color: const Color.fromRGBO(81, 27, 124, 1),
                        icon: Icons.add, func: () {
                      count += 1;
                      var f = mqttController.payloadMsg.value.split(',');
                      mqttController.publish("ganyang/cukong/sialan/data/suhu",
                          // "${count},${f[1]},${f[2]},${f[3]}, ${count}");
                          "${count}");
                    }),
                    Text(
                    //  "${mqttController.payloadMsg.value.split(',')[0]} *C",
                     "${count} *C",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Inria",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    CardCircle(context,
                        color: const Color.fromRGBO(81, 27, 124, 1),
                        icon: Icons.remove, func: () {
                      count -= 1;
                      var f = mqttController.payloadMsg.value.split(',');
                      mqttController.publish("ganyang/cukong/sialan/data/suhu",
                          // "${count},${f[1]},${f[2]},${f[3]}, ${count}");
                          "${count}");
                    }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
